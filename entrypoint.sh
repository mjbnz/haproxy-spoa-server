#!/bin/sh

if [ ! -f /data/spoa_python.py ];then
    cp /ps_python.py /data/spoa_python.py
fi

exec /spoa_server ${ARGS} -f /data/spoa_python.py

