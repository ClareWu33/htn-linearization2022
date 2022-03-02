#!/bin/bash

#author: Pascal Bercher (pascal.bercher@anu.edu.au)

./pandaPIparser/pandaPIparser $1 $2 parsed/problem$3.parsed > parsed/problem$3.parsed.log
./pandaPIgrounder/pandaPIgrounder parsed/problem$3.parsed parsed/problem$3.sas 2> parsed/problem$3.stderr.statistics > parsed/problem$3.stdout.statistics
./pandaPIengine/build/pandaPIengine parsed/problem$2.sas > parsed/problem$3.solution
