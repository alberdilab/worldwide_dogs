import csv

# Path to the CSV file
CSV_FILE = "samples.csv"

SRRS = []
with open(CSV_FILE) as csvfile:
    reader = csv.reader(csvfile)
    header = next(reader)
    for row in reader:
        if len(row) >= 3:
            SRRS.append(row[2])

rule all:
    input:
        expand("data/{srr}_1.fq.gz", srr=SRRS),
        expand("data/{srr}_2.fq.gz", srr=SRRS)

rule download_fastq:
    output:
        fq1=temp("data/{srr}_1.fastq"),
        fq2=temp("data/{srr}_2.fastq")
    threads: 1
    shell:
        """
        fasterq-dump {wildcards.srr} --split-files --threads {threads} -O data
        """

rule compress_fastq:
    input:
        fq1="data/{srr}_1.fastq",
        fq2="data/{srr}_2.fastq"
    output:
        fq1="data/{srr}_1.fq.gz",
        fq2="data/{srr}_2.fq.gz"
    threads: 1
    shell:
        """
        pigz -p {threads} -c {input.fq1} > {output.fq1}
        pigz -p {threads} -c {input.fq2} > {output.fq2}
        """
