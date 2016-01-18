#!/bin/sh
now=`date +'%Y%m%d_%H%M'`
filename="benchmark_fileio_seq_${now}_results"

echo "Running benchmarks and writing results to ${filename}"

sysbench --test=fileio --file-total-size=20G prepare >> ${filename}
sysbench --test=fileio --file-total-size=20G --file-test-mode=seqwr --max-time=300 --max-requests=0 run >> ${filename}
sysbench --test=fileio --file-total-size=20G prepare >> ${filename}                                                   

sysbench --test=fileio --file-total-size=20G cleanup >> ${filename}
sysbench --test=fileio --file-total-size=20G --file-test-mode=seqrd --max-time=300 --max-requests=0 run >> ${filename}
sysbench --test=fileio --file-total-size=20G cleanup >> ${filename}
