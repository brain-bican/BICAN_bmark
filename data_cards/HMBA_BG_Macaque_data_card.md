# `Human and Mammalian Brain Atlas (HMBA): Macaque Basal Ganglia` data card

### Description:
 - Summary: 
    - Macaque Basal Ganglia single nuclei
    - 10X Multiome RNA-seq measurements, UMI counts for `339,953` nuclei x `35219` genes
    - Annotations include `266` cell type clusters, `48` Group, `27` Subclass, `10` Class and `4` Neighborhood terms.
    - Each cell type cluster has at least `40` members. **(nuclei belonging to clusters with low membership were discarded)**

Distribution by `cluster_label`:<br>
<img align='center' style="padding:10px 0px 10px 0px; border-radius: 0%" src="./cluster_distribution.png"/>

Distribution by `subclass_label`:<br>
<img align='center' widt h=400 style="padding:10px 0px 10px 0px; border-radius: 0%" src="./subclass_distribution.png"/>
    
 - Primary data resources:
    - [Allen Institute Taxonomy](https://docs.google.com/document/d/1aP3yfpGT4rtI01lZ6-TB4wpPQU4U9sIlTQJVQa9DARA/edit#heading=h.o50obbrfixzs): Description of dataset and S3 downloads for original Allen Institute Taxonomy (AIT) file.
    - [BICAN Benchmark](): AIT file converted to BICAN benchmark format.
 - Format: [AIT (v0.6.6)](https://github.com/AllenInstitute/scrattch.taxonomy) h5ad
 - Publication: --
- Maintainers: Nelson Johansen, Yuanyuan Fu, BICAN Mapping Task Force
- Scripted end-to-end assembly: Yes

### Intended purpose:
 - Multi-label classification
 - Study classification model confidence calibration
 - Study technical and biological factors influencing model confidence

### Data integrity:
 - [Exploratory notebook](https://github.com/UCDNJJ/BICAN_bmark/blob/main/notebooks/HMBA_BG_Macaque_benchmark.ipynb)
 - Validation scripts

### Metadata data frame:

 |column name  | description |
 |:---|:---|
 | `anndata.obs.index`| Unique identifier for each nucleus |
 | `Donor_label`| Donor labels |
 | `Sex_label`| Sex labels |
 | `Species_label`| Species labels |
 | `Dissection_label`| Dissection labels |
 | `Cluster_label`| Categorical cell type label |
 | `Cluster_id`| Unique integer identifier per `cluster_label` |
 | `Cluster_color`| Unique `#rrggbb` color spec. per `cluster_label`|
 | `Group_id`| Unique integer identifier per `Group_label` |
 | `Group_label`| Categorical Group label |
 | `Group_color`| Unique `#rrggbb` color spec. string per `Group_label`|
 | `Subclass_id`| Unique integer identifier per `Subclass_label` |
 | `Subclass_label`| Categorical Subclass label |
 | `Subclass_color`| Unique `#rrggbb` color spec. string per `Subclass_label`|
 | `Class_id`| Integer identifier for `Class_label` |
 | `Class_label`| Categorical Class label |
 | `Class_color`| Unique `#rrggbb` color spec. string per `Class_label` |
 | `Neighborhood_id`| Integer identifier for `Neighborhood_label` |
 | `Neighborhood_label`| Categorical Neighborhood label |
 | `Neighborhood_color`| Unique `#rrggbb` color spec. string per `Neighborhood_label` |
 | `Genes Detected_label`| Number of genes with non-zero counts per nuclues |
 | `Number of UMIs_label`| Number of UMIs per nucleus |
