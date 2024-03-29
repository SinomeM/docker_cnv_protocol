# README

GitHub repository containing the necessary files to create the Docker
container with all necessary software to run the CNV calling macro-pipeline published
in Current Protocol <https://doi.org/10.1002/cpz1.621>.

The already built docker image is available on dockerhub,
<https://hub.docker.com/r/sinomem/docker_cnv_protocol>.

`docker pull sinomem/docker_cnv_protocol:latest` OR   
`singularity pull ibpcnv.simg docker://sinomem/docker_cnv_protocol:latest`

Included software:

- R 4.1.2
- htslib 1.14
- PennCNV 1.0.5
- deepEYE (https://github.com/XabierCS/eyeCNV)

R packages (among others):

- `data.table`
- `QCtreeCNV`
- `VariantAnnotation`
- `fpc`

