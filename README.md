# haproxy-spoa-server
A docker image to run a python [spoa_server from haproxy](https://github.com/haproxy/haproxy/tree/master/contrib/spoa_server).

On start, if `/data/spoa_python.py` doesn't exist, the sample script from the haproxy repository is copied into place and used.

Configuration of haproxy is left as an exercise to the user - there are several examples available online:
* https://github.com/haproxy/haproxy/blob/master/contrib/spoa_example/README
* https://github.com/haproxy/haproxy/blob/master/doc/SPOE.txt
* https://www.haproxy.com/blog/extending-haproxy-with-the-stream-processing-offload-engine/

### Example docker invocation:

    docker run -d                        \
           -v /srv/spoa-server:/data     \
           -p 172.17.0.1:12345:12345     \
           --restart=unless-stopped      \
       mjbnz/haproxy-spoa-server:latest

