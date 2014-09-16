FROM ubuntu:14.04
MAINTAINER Johannes 'fish' Ziemke <fish@freigeist.org> @discordianfish

RUN apt-get -qy update && apt-get -qy install ucarp

ADD . /ucarp
ENTRYPOINT [ "/ucarp/run" ]
