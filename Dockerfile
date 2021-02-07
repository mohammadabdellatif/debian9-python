FROM debian:9

RUN apt-get update && apt-get upgrade
RUN apt install -y --force-yes build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget
RUN wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tar.xz && tar -xf Python-3.8.0.tar.xz
WORKDIR Python-3.8.0
RUN ./configure --enable-optimizations
RUN make && make altinstall
WORKDIR /
RUN rm Python-3.8.0.tar.xz && rm -rf Python-3.8.0
RUN apt-get install -y python3-pip
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10