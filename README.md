
### Summary

Here we present benchmark datasets utilized in the BICAN Mapping Task Force to evaluation cell type annotation methods. This repository extends previous work by the Allen Institute on a [bmark](https://github.com/AllenInstitute/bmark) GitHub repo.

In particular we:

1. Provide a reproducible and transparent generation of benchmark datasets covering diverse cell type annotation scenarios.
2. Provide an easy to understand summary through data cards for each benchmark dataset,
3. Define a supervised classification task and performance metrics to evaluate cell type annotation methods.
4. Report evaluation for each cell type annotation method in a way that permits a fair comparisons across methods.

This effort attempts to formulate a **decentralized** approach to **continuous** benchmarking.
 - Individual computational groups are only responsible for tuning and submitting results for their own methods.
 - New methods can be added at any time, but results can be compared in a fair manner to previously submitted methods.
 - All reporting (data + model cards) is intended to be succinct yet accessible to a non-expert.

We hope that this benchmarking format can provide the basis for informed decision making regarding choice of cell type annotation methods for specific tasks.

----

### BICAN Mapping Task Force benchmark datasets
 
| Priority | Data set | Characteristics | Status | Download
| -- | -- | -- |  -- | --|
| 1.1 | HMBA Basal Ganglia | Donor effects, multi-species | Ready | S3 Link TBD
| 1.2 | Siletti el al. Human Brain | Donor effects | Ready | S3 Link TBD

----

### Benchmark format and expectations

The BICAN benchmark files extend the [Allen Inistute Taxonomy schema](https://github.com/AllenInstitute/AllenInstituteTaxonomy) by including a benchmark key in the `uns` of each anndata file which specifies train and validation splits. We have prespecificed a 10-fold cross-validation splits to compare mapping methods on the various benchmark tasks. Users can access the k-fold indices as follows:

```
benchamrk_anndata.uns.benchmark.k_fold["fold_1"].train_ind
benchamrk_anndata.uns.benchmark.k_fold["fold_1"].val_ind
```

It is expected that the mapping method train only on samples in `train_ind` then validate on samples specified in `val_ind`. Mapping method results should conform to the follow standard:

| cell_id | [Annotation_level]_[MAPPING_METHOD_NAME]_label | [Annotation_level]_[MAPPING_METHOD_NAME]_score
| -- | -- | -- | 
| adata.obs.index[`val_ind`] | Annotation name from taxonomy | Numeric indicating confidence of label assignment ranging from 0-1 |

----
### Contributors
TBD
