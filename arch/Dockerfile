FROM base/archlinux:2018.03.01
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN pacman -Syu --noconfirm && pacman --noconfirm -S base-devel clang cmake boost mpfr git
RUN pacman -Syu --noconfirm && pacman --noconfirm -S python python-pip python-matplotlib python-pipenv
RUN pacman -Syu --noconfirm && pacman --noconfirm -S tmux tmuxp

ADD install_log4cxx /tmp
RUN /tmp/install_log4cxx

RUN pacman -Syu --noconfirm && pacman --noconfirm -S ipython jupyter python-ipywidgets
RUN pacman --noconfirm -S python-h5py python-numpy gdb
RUN pacman --noconfirm -S ack jre8-openjdk
RUN pacman --noconfirm -S tk # for spark

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'


ADD install_aur_pkg /tmp
RUN cd /tmp && ./install_aur_pkg kubectl-bin
RUN cd /tmp && ./install_aur_pkg hadoop
RUN cd /tmp && ./install_aur_pkg apache-spark
