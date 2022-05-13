#!/bin/bash

#author: Pascal Bercher (pascal.bercher@anu.edu.au)
# Arguments:
# - the domain file
# - the problem file
# - a new filename that will be used as prefix for all the produced files.

./pandaPIparser/pandaPIparser $1 $2 ../parsed/problem$3.parsed > ../parsed/problem$3.parsed.log
./pandaPIgrounder/pandaPIgrounder ../parsed/problem$3.parsed ../parsed/problem$3.sas 2> ../parsed/problem$3.stderr.statistics > ../parsed/problem$3.stdout.statistics
./pandaPIengine/build/pandaPIengine ../parsed/problem$3.sas > ../parsed/problem$3.solution
