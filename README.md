# Gitpod Environments

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/torres-alexis/dp_envs)

---

## Getting Started

1. **Click the Gitpod button** above to launch the environment.
2. **Wait for the environment** to build and initialize.

---

## Log2FC Flagging


<details>
<summary>Click here to expand...</summary>

### Steps

1. **Launch** the Gitpod environment.
2. **Load the required data**:
   - `differential_expression_GLbulkRNAseq.csv` (rename as `GLDS-###_differential_expression_GLbulkRNAseq.csv`)
   - `VV_log_final_only_issues_GLbulkRNAseq.tsv` (or any log from `dp_tools` versions 1.1.8 - 1.3.4) (rename as `GLDS-###_VV_log_final_only_issues_GLbulkRNAseq.tsv`)
3. **Run the notebook execution** command:

    ```bash
    NUM=<YOUR_FILE_ACCESSION> # Usually formatted as GLDS-NNN. This ensures dataset name inclusion in final output.

    papermill notebooks/log2fc_flag_characterize.ipynb ${NUM}_log2fc_flag_characterize_GLbulkRNAseq.ipynb \
      -p DGE_TABLE_PATH ${NUM}_differential_expression_GLbulkRNAseq.csv \
      -p VV_LOG_PATH ${NUM}_VV_log_final_only_issues_GLbulkRNAseq.tsv \
      -p OUTPUT_PATH ${NUM}_log2fc_characterize_GLbulkRNAseq.csv

    jupyter nbconvert --to html ${NUM}_log2fc_flag_characterize_GLbulkRNAseq.ipynb
    # Generates HTML report: ${NUM}_log2fc_flag_characterize_GLbulkRNAseq.html
    ```

4. **Retrieve and inspect the HTML report**:
    - **'In [8]' cell**: Displays the printout with filtered out gene rows.
    - **'Out [9]' cell**: Examine dataframe rows for:
        - **Close to zero log2fc value**: May indicate that variation between direct and Deseq2 methods caused sign flip.
        - **High standard deviation to mean ratio (>1)**: Suggests higher variation between the methods.

</details>

---

## ERCC Analysis

<details>
<summary>Click here to expand...</summary>

### Steps

1. **Launch** the Gitpod environment.
2. **Load the required data**:
   - `ISA.zip` file for the dataset.
   - `RSEM_Unnormalized_Counts_GLbulkRNAseq.csv` file from the `/03-RSEM_Counts` output directory.
3. **Run the notebook execution** command:

    ```bash
    NUM=<YOUR_FILE_ACCESSION> # Usually formatted as GLDS-NNN. This ensures dataset name inclusion in final output.

    papermill notebooks/combined_ercc_analysis.ipynb ${NUM}_combined_ercc_analysis_GLbulkRNAseq.ipynb \
      -p ISA_PATH ${NUM}_ISA.zip \
      -p UNNORMALIZED_COUNTS_PATH ${NUM}_RSEM_Unnormalized_Counts_GLbulkRNAseq.csv

    jupyter nbconvert --to html ${NUM}_combined_ercc_analysis_GLbulkRNAseq.ipynb
    # Generates HTML report: ${NUM}_combined_ercc_analysis_GLbulkRNAseq.html
    ```

4. **Retrieve and inspect the HTML report**:
    - **'In [8]' cell**: Displays the printout with filtered out rows.
    - **'Out [9]' cell**: Examine the output for ERCC metrics and ratios.

</details>