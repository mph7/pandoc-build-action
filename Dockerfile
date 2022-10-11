FROM ubuntu:18.04

LABEL "repository"="https://github.com/mph7/pandoc-test"
LABEL "homepage"="https://github.com/mph7/pandoc-test"
LABEL "maintainer"="mph7"


RUN apt-get -y update
RUN apt-get -y install wget git

RUN wget https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb
RUN dpkg -i pandoc-2.19.2-1-amd64.deb

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
