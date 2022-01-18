FROM rocker/r-base:4.1.2

# install dependencies
RUN apt-get update --yes && \
  apt-get upgrade --yes && \
  apt-get install --yes \
    build-essential \
    libperl-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libssl-dev

# install R packages
# Additional R packages
ADD install_pkgs.R /tmp/
RUN Rscript /tmp/install_pkgs.R

# install htslib
COPY htslib-1.14 /opt/htslib-1.14
RUN cd /opt/htslib-1.14 && \
  ./configure --prefix=/opt/htslib && \
  make && \
  make install
ENV PATH="/opt/htslib/bin:${PATH}"

# install PLINK
COPY plink /opt/plink
ENV PATH="/opt/plink:${PATH}"

# install PennCNV
# sligltly modified from https://github.com/romanhaa/docker-containers/blob/master/PennCNV/1.0.5/Dockerfile
COPY PennCNV-1.0.5 /opt/PennCNV-1.0.5
ENV PATH="/opt/PennCNV-1.0.5:${PATH}"
RUN cd /opt/PennCNV-1.0.5/kext && \
  make
