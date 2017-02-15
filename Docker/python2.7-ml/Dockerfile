FROM ubuntu:16.04
MAINTAINER YTX
RUN apt-get update
RUN apt-get install -y python2.7
RUN apt-get install -y python-pip
RUN apt-get install -y python-tk
RUN pip install --upgrade pip
RUN pip install numpy
RUN pip install scipy
RUN pip install matplotlib
RUN pip install ipython[all]
RUN pip install pandas
CMD echo "ok python-ml complete"