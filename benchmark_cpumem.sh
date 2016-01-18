#!/bin/sh
now=`date +'%Y%m%d_%H%M'`
filename="benchmark_cpumem_${now}_results"

echo "Running benchmarks and writing results to ${filename}"

sysbench --test=cpu --cpu-max-prime=20000 run >> ${filename}
sysbench --test=cpu --cpu-max-prime=20000 --num-threads=2 run >> ${filename}
sysbench --test=threads --thread-locks=1 --max-time=20s run >> ${filename}
sysbench --test=mutex --num-threads=64 run >> ${filename}
sysbench --test=memory --num-threads=2 run >> ${filename}
