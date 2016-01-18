#!/bin/sh
now=`date +'%Y%m%d_%H%M'`
filename="benchmark_fileio_${now}_results"

echo "Running benchmarks and writing results to ${filename}"

sysbench --test=fileio --file-total-size=20G prepare >> ${filename}
sysbench --test=fileio --file-total-size=20G --file-test-mode=rndrw --max-time=300 --max-requests=0 run >> ${filename}
sysbench --test=fileio --file-total-size=20G cleanup >> ${filename}
