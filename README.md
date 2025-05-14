# Worldwide dogs metagenomics
Repository containing the code for the metagenomic analysis of worldwide dogs and wolfs

## Data retrieval

### 1. Clone repository

Clone this repository to your local environment or server using git.

```
git clone https://github.com/alberdilab/worldwide_dogs.git
cd worldwide_dogs
```

### 2. Create environment

Create conda environment containing all required dependencies and activate it

```
conda env create -f environment.yml
conda activate sra_download
```

### 3. Open screen session

Ideally the snakemake command should be executed within a screen session

```
screen -S data_download
```

### 4. Run snakemake

Run snakemake command to execute the data download

```
conda activate sra_download
snakemake --workflow-profile .
conda deactivate
```

## Genome-resolved metagenomics

### 1. Get reference genome

```
mkdir reference
cd reference
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/011/100/685/GCF_011100685.1_UU_Cfam_GSD_1.0/GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna.gz
gunzip GCF_011100685.1_UU_Cfam_GSD_1.0_genomic.fna.gz
cd ..
```

### 2. Run genome-resolved metagenomics pipeline

```
conda activate drakkar
drakkar complete -f input.tsv -m individual
```
