FROM base/archlinux:2018.03.01
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# tk for spark
RUN pacman -Syu --noconfirm && pacman --noconfirm -S base-devel clang cmake boost mpfr git gdb ack jre8-openjdk tk \
    python python-pip python-matplotlib python-pipenv python-h5py python-numpy \
    ipython jupyter python-ipywidgets \
    tmux tmuxp nano emacs vim

ADD install_aur_pkg /tmp
RUN cd /tmp && ./install_aur_pkg log4cxx
RUN cd /tmp && ./install_aur_pkg kubectl-bin
RUN cd /tmp && ./install_aur_pkg hadoop
RUN cd /tmp && ./install_aur_pkg apache-spark

ADD start_scripts /start_scripts


RUN pacman -Syu --noconfirm && pacman --noconfirm -S bash-completion
