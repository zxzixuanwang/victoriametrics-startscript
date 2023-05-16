#!/bin/bash
nohup vminsert-prod \
        -httpListenAddr :8480 \
        -loggerLevel INFO \
        -maxConcurrentInserts 20 \
        -memory.allowedPercent 20 \
        -insert.maxQueueDuration 1m \
        -opentsdbhttp.maxInsertRequestSize 32MB \
        -opentsdbhttpTrimTimestamp 1m  \
        -storageNode xx:8482,xx:8482,xx:8482 \
        -loggerTimezone Asia/Shanghai > insert.log 2>&1 &

echo $! > insert.pid