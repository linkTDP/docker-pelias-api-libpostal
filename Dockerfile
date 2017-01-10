FROM pearlshare/libpostal-docker
#FROM  elasticsearch:2.4.3

ARG PROXY
ENV http_proxy=$PROXY
ENV https_proxy=$PROXY
ENV HTTP_PROXY=$PROXY
ENV HTTPS_PROXY=$PROXY

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8
# RUN locale-gen en_US.UTF-8
# RUN update-locale LANG=en_US.UTF-8

RUN apt-get update && apt-get install -y \
    curl libsnappy-dev autoconf automake libtool pkg-config \
    git
RUN apt-get install -y curl make cmake
run apt-get install -y wget software-properties-common

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs

RUN apt-get install -y git


# RUN mkdir /pelias
COPY api /api
RUN echo new
COPY pelias.json /root
RUN ls -la
WORKDIR /api
RUN npm rb node-postal
COPY start-api.sh /api
RUN sed -i -e 's/\r$//' /api/start-api.sh
RUN chmod +x /api/start-api.sh
RUN export http_proxy=''
CMD /api/start-api.sh
EXPOSE 9300 3100
