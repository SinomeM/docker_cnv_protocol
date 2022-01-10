FROM rocker/rstudio:4.1.2

# install R packages
# Additional R packages
ADD install_pkgs.R /tmp/
RUN R -f /tmp/install_pkgs.R


# sligltly modified from https://github.com/romanhaa/docker-containers/blob/master/PennCNV/1.0.5/Dockerfile
# install system libraries
RUN apt-get update --yes && \
  apt-get upgrade --yes && \
  apt-get install --yes \
    build-essential \
    libperl-dev

# install PennCNV
COPY PennCNV-1.0.5.tar.gz /opt/PennCNV-1.0.5.tar.gz
RUN cd /opt && \
  tar xzf PennCNV-1.0.5.tar.gz && \
  rm PennCNV-1.0.5.tar.gz
ENV PATH="/opt/PennCNV-1.0.5:${PATH}"
RUN cd /opt/PennCNV-1.0.5/kext && \
  make
