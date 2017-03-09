FROM ubuntu:16.04
MAINTAINER YTX
RUN rm /etc/apt/sources.list
ADD sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y build-essential libssl-dev libffi-dev python-dev libxml2-dev
RUN apt-get install -y python2.7
RUN apt-get install -y python-pip
RUN pip install --upgrade pip
RUN pip install scrapy
RUN pip install ipython[all]
CMD echo "ok python-scrapy complete"