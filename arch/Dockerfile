FROM archlinux/base:latest
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

RUN sed -i -e 's/#MAKEFLAGS="-j2"/MAKEFLAGS=-j'$(nproc)'/' -e 's/xz -c -z/xz -c -z -T '$(nproc)'/' /etc/makepkg.conf
# to consider  -e 's/-march=x86-64 -mtune=generic/-march=native/'

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN pacman -Syu --noconfirm && pacman --noconfirm -S \
    inetutils iputils \
    pv htop nethogs iftop iproute2  parallel \
    base-devel clang cmake boost intel-tbb mpfr swig ninja valgrind protobuf git gdb ack jdk8-openjdk tk gperftools \
    llvm-libs \
    eigen flint log4cxx \
    opencv \
    tmux tmuxp nano emacs vim bash-completion \
    unzip lsb-release

RUN useradd  --shell=/bin/false build && usermod -L build &&\
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
    
ADD install_aur_pkg /tmp
USER build

USER root
RUN pacman -Syu --noconfirm && pacman --noconfirm -S \
    cython python-pip python-pytest \
    python \
    python-numpy \
    python-scipy \
    python-matplotlib python-pipenv python-h5py python-netcdf4 python-protobuf pybind11 \
    ipython jupyter python-ipywidgets jupyter-widgetsnbextension python-gobject \
    igraph python-igraph python-networkx \
    python-pandas python-scikit-learn \
    python-zeep python-beautifulsoup4\
    python-pydot graphviz \
    python-arrow python-construct \
    python-celery rabbitmq rabbitmqadmin

RUN pacman -Syu --noconfirm && pacman --noconfirm -S \
    python-pytorch-opt

USER build
ADD install_aur_pkg /tmp
ADD pkgs /tmp/pkgs
#RUN cd /tmp && ./install_aur_pkg nvidia-utils-430 "x" /tmp/pkgs


#RUN pacman --noconfirm -U \
#      https://archive.archlinux.org/packages/t/tensorflow-opt-cuda/tensorflow-opt-cuda-1.14.0-2-x86_64.pkg.tar.xz \
#      https://archive.archlinux.org/packages/p/python-tensorflow-opt-cuda/python-tensorflow-opt-cuda-1.14.0-2-x86_64.pkg.tar.xz


#RUN pacman -Syu --noconfirm && pacman --noconfirm -S python-tensorflow-opt-cuda

#RUN pacman -Syu --noconfirm && pacman --noconfirm -S tensorflow-opt-cuda python-tensorflow-opt-cuda
#RUN python -c 'import tensorflow as tf;print(tf)'



USER build
#RUN cd /tmp && ./install_aur_pkg python-mpld3
RUN cd /tmp && ./install_aur_pkg python-llvmlite
RUN cd /tmp && ./install_aur_pkg python-numba

#RUN cd /tmp && ./install_aur_pkg python-bz2file
#RUN cd /tmp && ./install_aur_pkg python-smart-open
#RUN cd /tmp && ./install_aur_pkg python-gensim
#RUN cd /tmp && ./install_aur_pkg log4cxx
#RUN cd /tmp && ./install_aur_pkg kubectl-bin
# RUN cd /tmp && ./install_aur_pkg hadoop
#RUN cd /tmp && ./install_aur_pkg apache-spark
#RUN cd /tmp && ./install_aur_pkg python-graph-tool
#RUN cd /tmp && ./install_aur_pkg miniconda3
#RUN cd /tmp && ./install_aur_pkg or-tools
#RUN cd /tmp && ./install_aur_pkg python-watchdog-git


#RUN cd /tmp && ./install_aur_pkg python-fastparquet
#RUN cd /tmp && ./install_aur_pkg arrow
#RUN cd /tmp && ./install_aur_pkg scipoptsuite
#RUN cd /tmp && ./install_aur_pkg python-pyscipopt

# RUN cd /tmp && ./install_aur_pkg python-breathe #for pybind
#RUN cd /tmp && ./install_aur_pkg pybind11

RUN cd /tmp && ./install_aur_pkg fasttext
RUN cd /tmp && ./install_aur_pkg compdb
RUN cd /tmp && ./install_aur_pkg ann

RUN sudo pip install astropy sunpy
RUN sudo pip install drms
#RUN sudo pip install ortools
RUN sudo pip install dionysus
#RUN sudo pip install kubernetes
#RUN sudo pip install sktime

# apache kafka
#RUN cd /tmp && ./install_aur_pkg zookeeper
#RUN cd /tmp && ./install_aur_pkg kafka
#RUN cd /tmp && ./install_aur_pkg python-kafka
#RUN cd /tmp && ./install_aur_pkg librdkafka-git
#RUN cd /tmp && ./install_aur_pkg cppkafka-git
#RUN cd /tmp && ./install_aur_pkg kafkacat-git

RUN cd /tmp && ./install_aur_pkg python-pyviz_comms

#RUN cd /tmp && ./install_aur_pkg python-holoviews # old version, 1.12, use pip
#RUN cd /tmp && ./install_aur_pkg python-bokeh
RUN sudo pip install holoviews


USER root

RUN ln -s /opt_shared/ibm /opt/ibm
#RUN cd /opt && git clone https://github.com/intel/parallelstl.git
RUN cd /opt && git clone https://github.com/mrzv/dionysus.git

ADD start_scripts /start_scripts

# RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local.conf

RUN rm -fr "/tmp/*"
#RUN sed -i 's|SPARK_MASTER_IP|#SPARK_MASTER_IP| ; s|SPARK_LOCAL_IP|#SPARK_LOCAL_IP|' /etc/apache-spark/spark-env.sh

RUN userdel build # so no conflict with the Host userids

