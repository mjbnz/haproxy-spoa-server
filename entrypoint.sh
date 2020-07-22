#!/bin/sh

if [ ! -f /data/spoa_python.py ];then
    cp /ps_python.py /data/spoa_python.py
fi

[ -n "$DEBUG" ] && DEBUG="-d"

exec /spoa_server ${DEBUG} -f /data/spoa_python.py

