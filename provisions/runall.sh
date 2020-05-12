#!/bin/bash


./01_nvim_bootstrap.sh &&\
./02_get_nvim_deps.sh &&\
./03_get_personal_config.sh &&\
source ~/.bashrc &&\
./04_init_nvim.sh 
