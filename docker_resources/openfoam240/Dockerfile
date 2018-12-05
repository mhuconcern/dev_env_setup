FROM ubuntu:16.04

LABEL maintainer="Ali Tohidi ali@oneconcern.com"

USER root

# installing OS essentials
RUN apt-get update \
    && apt-get install -yq curl make vim nano \
    && apt-get install -yq --no-install-recommends \
    gcc \
    wget \
    bzip2 \
    ca-certificates \
    sudo \
    locales \
    fonts-liberation \
    unzip \
    g++ \
    # required by openfoam
    && apt-get install -yq git-core build-essential cmake flex bison zlib1g-dev qt4-dev-tools libqt4-dev libqtwebkit-dev gnuplot \
    libreadline-dev libncurses5-dev libxt-dev libopenmpi-dev openmpi-bin libboost-system-dev libboost-thread-dev libgmp-dev \
    libmpfr-dev python python-dev libcgal-dev unzip libglu1-mesa-dev libqt4-opengl-dev libgsl-dev


RUN apt-get -yq dist-upgrade \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# use unicode
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen

# install Tini
RUN wget --quiet https://github.com/krallin/tini/releases/download/v0.18.0/tini && \
    echo "12d20136605531b09a2c2dac02ccee85e1b874eb322ef6baf7561cd93f93c855 *tini" | sha256sum -c - && \
    mv tini /usr/local/bin/tini && \
    chmod +x /usr/local/bin/tini

# Configure environment
ENV LC_ALL=en_US.UTF-8 \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    HOME=/home 


# installing OpenFOAM 2.4.0
WORKDIR ${HOME}
RUN mkdir -p OpenFOAM && cd ${HOME}/OpenFOAM \ 
    && wget "http://downloads.sourceforge.net/foam/OpenFOAM-2.4.0.tgz?use_mirror=mesh" -O OpenFOAM-2.4.0.tgz \ 
    && tar -xzf OpenFOAM-2.4.0.tgz 

ADD ./make_openfoam240.sh ${HOME}/OpenFOAM
WORKDIR ${HOME}/OpenFOAM/
RUN chmod a+x make_openfoam240.sh \
    && pwd && ls -ltr \
    && ./make_openfoam240.sh

# installing LEMOS
ADD ./make_lemos.sh ${HOME}/
COPY ./LEMOS-2.4.x-master.zip ${HOME}/
WORKDIR ${HOME}
RUN chmod a+x ./make_lemos.sh \
    && ./make_lemos.sh

WORKDIR ${HOME}
EXPOSE 7777 8888 52698

ENTRYPOINT ["tini", "-g", "--"]
CMD ["/bin/bash"]