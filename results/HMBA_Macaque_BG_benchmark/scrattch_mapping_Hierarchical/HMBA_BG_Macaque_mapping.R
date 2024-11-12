## singularity shell --cleanenv docker://njjai/scrattch_mapping:0.6.6
## Load the libraries
suppressPackageStartupMessages({
  library(scrattch.taxonomy)
  library(scrattch.mapping)
  library(scrattch.patchseq)
  library(reticulate)
})
cell_type_mapper <- import("cell_type_mapper")

## Working directory
taxonomyDir = "/allen/programs/celltypes/workgroups/rnaseqanalysis/HMBA/Aim1_Regional_Taxonomies/BasalGanglia/Macaque/"
setwd(taxonomyDir)

## Read in the taxonomy
AIT.anndata = loadTaxonomy(taxonomyDir, "HMBA_Macaque_BG_082024_AIT_benchmark.h5ad")

## Loop through iterations 
for(fold in names(AIT.anndata$uns$benchmark$k_fold)){
    print(fold)

    # +1 because R is 1-indexed
    AIT.anndata_bmark = AIT.anndata[AIT.anndata$uns$benchmark$k_fold[[fold]]$train_ind+1,]

    ## Ensure count matrix and annotations are in the same order.
    taxonomy.counts = as.matrix(Matrix::t(AIT.anndata_bmark$raw$X))
    taxonomy.counts = as(taxonomy.counts, "sparseMatrix") 
    taxonomy.anno = AIT.anndata_bmark$obs
    taxonomy.anno$cell_id = rownames(taxonomy.anno)

    ##
    taxonomy.anno <- taxonomy.anno %>% select(-matches("_id|_color"))
    names(taxonomy.anno) <- gsub("_label", "", names(taxonomy.anno))

    ## Compute binary marker genes for clusters
    binary.genes = AIT.anndata_bmark$var_names[AIT.anndata_bmark$var$highly_variable_genes] ##top_binary_genes(taxonomy.counts, taxonomy.anno$cluster, 2000)

    ## Compute UMAP coordinates
    umap.coords = AIT.anndata_bmark$obsm$X_umap
    rownames(umap.coords) = colnames(taxonomy.counts)

    ## Build Shiny taxonomy
    AIT.anndata = buildTaxonomy(counts = taxonomy.counts,
                            meta.data = taxonomy.anno,
                            feature.set = binary.genes,
                            umap.coords = umap.coords,
                            taxonomyTitle=paste0("HMBA_Macaque_BG_082024_AIT_bmark_", fold),
                            taxonomyDir=paste0("/allen/programs/celltypes/workgroups/rnaseqanalysis/HMBA/Aim1_Regional_Taxonomies/BasalGanglia/Macaque/Benchmark", fold),
                            subsample=-1)

    ## 
    library(reticulate)
    cell_type_mapper <- import("cell_type_mapper")

    ## Provide hierarchy of the taxonomy
    hierarchy = list("Neighborhood_label", "Class_label", "Subclass_label", "Group_label", "cluster_label")

    ## Build MapMyCells stats into AIT file for hierarchy mapping
    AIT.anndata = addMapMyCells(AIT.anndata, hierarchy)

    ## Map! Returns an S4 class with mapping results.
    mapping.anno = taxonomy_mapping(AIT.anndata=AIT.anndata,
                                query.data=Matrix::t(AIT.anndata[AIT.anndata$uns$benchmark$k_fold[[fold]]$val_ind+1,]$X),
                                label.cols=c("Neighborhood_label", "Class_label", "Subclass_label", "Group_label"), ## Which obs in AIT.anndata contain annotations to map. E.g. "class", "subclass", etc.
                                corr.map=TRUE,
                                tree.map=FALSE,
                                hierarchical.map=TRUE,
                                seurat.map=FALSE)

    ## Extract mapping results from S4 mappingClass
    mapping.results = getMappingResults(mapping.anno, scores = TRUE)

    ## Save mapping results
    save(mapping.results, file=paste0("/allen/programs/celltypes/workgroups/rnaseqanalysis/HMBA/Aim1_Regional_Taxonomies/BasalGanglia/Macaque/Benchmark/", fold, "/mapping_results.rda"))
}