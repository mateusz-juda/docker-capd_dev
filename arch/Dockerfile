FROM base/archlinux:2018.03.01
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen

RUN sed -i -e 's/#MAKEFLAGS="-j2"/MAKEFLAGS=-j'$(nproc)'/' -e 's/xz -c -z/xz -c -z -T '$(nproc)'/' /etc/makepkg.conf
# to consider  -e 's/-march=x86-64 -mtune=generic/-march=native/'

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

# tk for spark
RUN pacman -Syu --noconfirm && pacman --noconfirm -S base-devel clang cmake boost mpfr git gdb ack jre8-openjdk intel-tbb tk \
    python python-pip python-matplotlib python-pipenv python-h5py python-numpy \
    ipython jupyter python-ipywidgets \
    tmux tmuxp nano emacs vim bash-completion

ADD install_aur_pkg /tmp
RUN cd /tmp && ./install_aur_pkg log4cxx
RUN cd /tmp && ./install_aur_pkg kubectl-bin
RUN cd /tmp && ./install_aur_pkg hadoop
RUN cd /tmp && ./install_aur_pkg apache-spark

ADD start_scripts /start_scripts

RUN echo "/usr/local/lib" > /etc/ld.so.conf.d/usr_local.conf

