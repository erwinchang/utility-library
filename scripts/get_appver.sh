#!/bin/bash

R_UCI=uci
R_PATH=${GIT_TOP_DIR}/src
R_FILE=release
R_MAJ_VER=`${R_UCI} -q -c ${R_PATH} get ${R_FILE}.app.major_num`
R_MIN_VER=`${R_UCI} -q -c ${R_PATH} get ${R_FILE}.app.minor_num`
R_MAT_VER=`${R_UCI} -q -c ${R_PATH} get ${R_FILE}.app.mat_num`
echo "${R_MAJ_VER}.${R_MIN_VER}.${R_MAT_VER}"
