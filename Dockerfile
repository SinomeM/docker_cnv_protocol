FROM rocker/rstudio:4.1.2

# install R packages
# Additional R packages
ADD install_pkgs.R /tmp/
RUN R -f /tmp/install_pkgs.R

# install htslib
COPY htslib-1.14 /opt/htslib-1.14
RUN cd /opt/htslib-1.14 && \
  ./configure --prefix=/opt/htslib && \
  make && \
  make install
ENV PATH="/opt/htslib/bin:${PATH}"


# install PennCNV
# sligltly modified from https://github.com/romanhaa/docker-containers/blob/master/PennCNV/1.0.5/Dockerfile
RUN apt-get update --yes && \
  apt-get upgrade --yes && \
  apt-get install --yes \
    build-essential \
    libperl-dev
COPY v1.0.5 /opt/PennCNV-1.0.5
ENV PATH="/opt/PennCNV-1.0.5:${PATH}"
RUN cd /opt/PennCNV-1.0.5/kext && \
  make
