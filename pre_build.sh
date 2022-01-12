#! /bin/bash

# download htslib for tabix
wget https://github.com/samtools/htslib/releases/download/1.14/htslib-1.14.tar.bz2
tar xzf htslib-1.14.tar.bz2
rm htslib-1.14.tar.bz2

# download PennCNV
wget https://github.com/WGLab/PennCNV/archive/refs/tags/v1.0.5.tar.gz
tar xzf v1.0.5.tar.gz
rm v1.0.5.tar.gz

# download PLINK
wget https://s3.amazonaws.com/plink1-assets/plink_linux_x86_64_20210606.zip
unzip plink_linux_x86_64_20210606.zip
rm plink_linux_x86_64_20210606.zip
