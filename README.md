# README

GitHub repository containing the necessary files to create the Docker
container with all necessary software to run the CNV calling macro-pipeline published
in Current Protocol **[insert link]**.

The already built docker image is available on dockerhub,
<https://hub.docker.com/r/sinomem/docker_cnv_protocol>.

`docker pull sinomem/docker_cnv_protocol:latest` OR   
`singularity pull ibpcnv.simg docker://sinomem/docker_cnv_protocol:latest`

Included software:

- R 4.1.2
- htslib 1.14
- PennCNV 1.0.5

R packages (among others):

- `data.table`
- `QCtreeCNV`
- `VariantAnnotation`
- `fpc`

