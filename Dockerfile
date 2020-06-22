FROM python:3.8-slim

RUN apt-get update \
 && apt-get -y install git make gcc \
 && git clone https://github.com/haproxy/haproxy.git /code \
 && cd /code/contrib/spoa_server \
 && git checkout f1cad3828 \
 && USE_PYTHON=1 make \
 && cp /code/contrib/spoa_server/spoa /spoa_server \
 && cp /code/contrib/spoa_server/ps_python.py /ps_python.py \
 && cd / \
 && rm -r /code \
 && apt-get --autoremove -y remove git make gcc \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install requests

COPY entrypoint.sh /entrypoint

VOLUME /data

STOPSIGNAL SIGKILL

EXPOSE 12345

ENTRYPOINT ["/entrypoint"]

