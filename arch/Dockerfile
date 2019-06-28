FROM archlinux/base:latest
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

RUN sed -i -e 's/#MAKEFLAGS="-j2"/MAKEFLAGS=-j'$(nproc)'/' -e 's/xz -c -z/xz -c -z -T '$(nproc)'/' /etc/makepkg.conf
# to consider  -e 's/-march=x86-64 -mtune=generic/-march=native/'

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# tk for spark
RUN pacman -Syu --noconfirm && pacman --noconfirm -S \
    inetutils iputils \
    base-devel clang cmake boost mpfr swig ninja valgrind protobuf git gdb ack jdk8-openjdk intel-tbb tk \
    pv htop nethogs iftop iproute2 \
    python cython python-pip python-pytest python-matplotlib python-pipenv python-h5py python-netcdf4 python-numpy python-protobuf pybind11 \
    ipython jupyter python-ipywidgets jupyter-widgetsnbextension python-gobject \
    igraph python-igraph python-networkx \
    eigen linbox flint \
    python-pandas python-scikit-learn python-scipy \
    python-tensorflow-opt tensorboard \
    python-pydot graphviz \
    python-celery rabbitmq rabbitmqadmin \
    parallel \
    blender cgal \
    tmux tmuxp nano emacs vim bash-completion \
    unzip lsb-release
   

RUN useradd --no-create-home --shell=/bin/false build && usermod -L build &&\
    echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    echo "root ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
ADD install_aur_pkg /tmp
USER build
#RUN cd /tmp && ./install_aur_pkg python-bz2file
#RUN cd /tmp && ./install_aur_pkg python-smart-open
#RUN cd /tmp && ./install_aur_pkg python-gensim
RUN cd /tmp && ./install_aur_pkg log4cxx
RUN cd /tmp && ./install_aur_pkg kubectl-bin
# RUN cd /tmp && ./install_aur_pkg hadoop
#RUN cd /tmp && ./install_aur_pkg apache-spark
#RUN cd /tmp && ./install_aur_pkg python-graph-tool
#RUN cd /tmp && ./install_aur_pkg miniconda3
#RUN cd /tmp && ./install_aur_pkg or-tools
#RUN cd /tmp && ./install_aur_pkg python-watchdog-git


#RUN cd /tmp && ./install_aur_pkg python-fastparquet
#RUN cd /tmp && ./install_aur_pkg arrow
RUN cd /tmp && ./install_aur_pkg scipoptsuite
#RUN cd /tmp && ./install_aur_pkg python-pyscipopt

# RUN cd /tmp && ./install_aur_pkg python-breathe #for pybind
#RUN cd /tmp && ./install_aur_pkg pybind11

RUN cd /tmp && ./install_aur_pkg fasttext
RUN cd /tmp && ./install_aur_pkg compdb
RUN cd /tmp && ./install_aur_pkg ann

RUN sudo pip install astropy sunpy
RUN sudo pip install drms
RUN sudo pip install ortools
RUN sudo pip install dionysus
RUN sudo pip install kubernetes


# apache kafka
#RUN cd /tmp && ./install_aur_pkg zookeeper
#RUN cd /tmp && ./install_aur_pkg kafka
#RUN cd /tmp && ./install_aur_pkg python-kafka
#RUN cd /tmp && ./install_aur_pkg librdkafka-git
#RUN cd /tmp && ./install_aur_pkg cppkafka-git
#RUN cd /tmp && ./install_aur_pkg kafkacat-git


USER root
RUN ln -s /opt_shared/ibm /opt/ibm
RUN cd /opt && git clone https://github.com/intel/parallelstl.git

ADD start_scripts /start_scripts

# RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local.conf

RUN rm -fr "/tmp/*"
#RUN sed -i 's|SPARK_MASTER_IP|#SPARK_MASTER_IP| ; s|SPARK_LOCAL_IP|#SPARK_LOCAL_IP|' /etc/apache-spark/spark-env.sh

RUN userdel build # so no conflict with the Host userids

