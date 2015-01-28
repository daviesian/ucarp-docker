# ucarp-docker

This image runs a given command and ucarp to provide a highly available
virtual IP.

This requires host networking which is available on Docker >= 0.11.

## Usage
On it's own this image is not very useful. For testing purposes you
can run netcat like this:

  docker run --cap-add=NET_ADMIN --net=host -p 2342:2342 \
         ucarp "nc -l -k -p 2342" 1.2.3.4 foobar23 eth1

For real use cases this image should be used as base image like this:

  FROM fish/ucarp
  RUN apt-get -qy update && apt-get -qy install unbound
  ENTRYPOINT [ "/ucarp/run", "unbound -d" ]
  
Such image can be run like this:

  docker run --cap-add=NET_ADMIN --net=host -p 53:53 -p 53:53/udp \
         fish/unbound 1.2.3.4 foobar23 eth1

You can set the IPS env var to bind additional IPs to on active system.

See https://github.com/discordianfish/unbound-docker for a complete example.
