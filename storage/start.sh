#!/bin/bash
nohup vmstorage-prod \
           -storageDataPath vmstorage-data \
           -retentionPeriod 90d \
           -httpListenAddr :8482 \
           -vminsertAddr :8400 \
           -vmselectAddr :8401 \
           -precisionBits 64 \
           -bigMergeConcurrency 4 \
           -search.maxUniqueTimeseries 100000000 \
           -search.maxTagKeys 200000 \
           -search.maxTagValues 200000 \
           -search.maxTagValueSuffixesPerSearch 200000 \
           -loggerFormat default \
           -loggerLevel INFO \
           -loggerTimezone Asia/Shanghai \
           -http.connTimeout 2m0s \
           -http.disableResponseCompression true \
           -http.idleConnTimeout 1m0s \
           -memory.allowedPercent 60 \
           -rpc.disableCompression true \
           -smallMergeConcurrency 4 \
           -storage.minFreeDiskSpaceBytes 5GB  \
           > storage.log 2>&1 &

echo $! > storage.pid
