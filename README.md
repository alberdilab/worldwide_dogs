# Worldwide dogs metagenomics
Repository containing the code for the metagenomic analysis of worldwide dogs and wolfs

## 1. Clone repository

Clone this repository to your local environment or server using git.

```
git clone https://github.com/alberdilab/worldwide_dogs.git
cd worldwide_dogs
```

## 2. Create environment

Create conda environment containing all required dependencies and activate it

```
conda env create -f environment.yml
conda activate sra_download
```

## 3. Open screen session

Ideally the snakemake command should be executed within a screen session

```
screen -S data_download
```


## 4. Run snakemake

Run snakemake command to execute the data download

```
snakemake --workflow-profile .
```
