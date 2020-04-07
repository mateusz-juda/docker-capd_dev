FROM archlinux/base:latest
MAINTAINER Mateusz Juda <mateusz.juda@gmail.com>

RUN sed -i -e 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && locale-gen
RUN sed -i -e 's/#MAKEFLAGS="-j2"/MAKEFLAGS=-j'$(nproc)'/' -e 's/xz -c -z/xz -c -z -T '$(nproc)'/' /etc/makepkg.conf

ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

RUN pacman -Syu --noconfirm && pacman --noconfirm -S \
	 sagemath

