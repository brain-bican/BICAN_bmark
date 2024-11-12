
### Summary

Here we present benchmark datasets utilized in the BICAN Mapping Task Force to evaluation cell type annotation methods. This repository extends previous work by the Allen Institute on a [bmark](https://github.com/AllenInstitute/bmark) GitHub repo.

In particular we:

1. Provide a reproducible and transparent generation of benchmark datasets covering diverse cell type annotation scenarios.
2. Provide an easy to understand summary through data cards for each benchmark dataset,
3. Define a supervised classification task and performance metrics to evaluate cell type annotation methods.
4. Report evaluation for each cell type annotation method in a way that permits a fair comparisons across methods.

This effort attempts to formulate a **decentralized** approach to **continuous** benchmarking.
 - Individualcomputational groups are only responsible for tuning and submitting results for their own methods.
 - New methods can be added at any time, but results can be compared in a fair manner to previously submitted methods.
 - All reporting (data + model cards) is intended to be succinct yet accessible to a non-expert.

We hope that this format can prevent misrepresentation of methods, have archival value through a minimal but necessary level of reproducibility, and provide the basis for informed decision making regarding choice of cell type annotation methods for specific tasks.

----

### BICAN Mapping Task Force benchmark datasets
 
| Priority | Data set | Characteristics | Status | Download
| -- | -- | -- |  -- | --|
| 1.1 | HMBA Basal Ganglia | Donor effects, multi-species | Ready | S3 Link TBD
| 1.2 | Siletti el al. Human Brain | Donor effects | Ready | S3 Link TBD

----

### Environment
```bash
conda create -n bmark
conda activate bmark
conda install python==3.8
conda install seaborn scikit-learn statsmodels numba pytables
conda install -c conda-forge python-igraph leidenalg
pip install scanpy
pip install gdown timebudget autopep8 toml sklearn
pip install jupyterlab
pip install -e .
```
----
### Contributors
TBD
