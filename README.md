# worldwide_dogs
Repository containing the code for the metagenomic analysis of worldwide dogs and wolfs

## Clone repository

Clone this repository to your local environment or server using git.

```
git clone https://github.com/alberdilab/worldwide_dogs.git
cd worldwide_dogs
```

## Create environment

Create conda environment containing all required dependencies and activate it

```
conda env create -f environment.yml
conda activate sra_download
```

## Open screen session

Ideally the snakemake command should be executed within a screen session

```
screen -S data_download
```


## Run snakemake

Run snakemake command to execute the data download

```
snakemake --workflow-profile .
```
