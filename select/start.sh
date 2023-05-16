#/bin/bash
mkdir -p select-cache
nohup vmselect-prod \
      -httpListenAddr :8481 \
      -search.maxSeries 300000 \
      -search.maxUniqueTimeseries 1000000 \
      -search.queryStats.lastQueriesCount 40000 \
      -search.latencyOffset 20s \
      -search.logSlowQueryDuration 10s \
      -search.maxQueryLen 64MB \
      -search.maxQueueDuration 20s \
      -search.cacheTimestampOffset 10m0s \
      -search.maxConcurrentRequests 8 \
      -search.maxTSDBStatusSeries 10000 \
      -cacheDataPath select-cache \
      -selectNode=xx:8481,xx:8481,xx:8481\
      -storageNode=xx:8401,xx:8401,xx:8401 \
      -loggerTimezone Asia/Shanghai \
      -vmstorageDialTimeout 5s \
      -http.connTimeout 2m0s \
      -http.disableResponseCompression true \
      -http.idleConnTimeout 2m0s \
      -loggerLevel INFO \
      -memory.allowedPercent 30 \
      -clusternative.disableCompression true \
      -clusternative.maxTagValueSuffixesPerSearch 10000 \
      -vmstorageDialTimeout 5s > select.log 2>&1 &
echo $! > select.pid
