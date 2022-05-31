FROM ubuntu:latest

# losely inspired from https://github.com/romanhaa/docker-containers/blob/master/PennCNV/1.0.5/Dockerfile
# and https://github.com/rocker-org/rocker/blob/master/r-base/4.1.2/Dockerfile

# install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update --yes && \
  apt-get upgrade --yes

RUN apt-get install -y --no-install-recommends \
  build-essential \
  libperl-dev \
  zlib1g-dev \
  libbz2-dev \
  liblzma-dev \
  libcurl4-openssl-dev \
  libssl-dev \
  libxml2-dev \
  ed \
  less \
  locales \
  vim-tiny \
  wget \
  ca-certificates \
  fonts-texgyre \
  gfortran \
  fort77 \
  libreadline-dev \
  xorg-dev \
  liblzma-dev \
  libblas-dev \
  gcc-multilib \
  libpcre2-dev \
  libcurl4-openssl-dev

# install R
COPY R-4.1.2 /opt/R-4.1.2
RUN cd /opt/R-4.1.2 && ./configure && make && make install

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

#   # install PLINK
#   COPY plink /opt/plink
#   ENV PATH="/opt/plink:${PATH}"

# install PennCNV
COPY PennCNV-1.0.5 /opt/PennCNV-1.0.5
ENV PATH="/opt/PennCNV-1.0.5:${PATH}"
RUN cd /opt/PennCNV-1.0.5/kext && \
  make

# install bcftools
COPY bcftools-1.14 /opt/bcftools-1.14
RUN cd /opt/bcftools-1.14 && \
  ./configure --prefix=/opt/bcftools && \
  make && \
  make install
ENV PATH="/opt/bcftools/bin:${PATH}"

# install DeepEYE

COPY eyeCNV /opt/eyeCNV
ENV PATH="/opt/eyeCNV:${PATH}"
