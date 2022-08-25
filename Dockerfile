#author: chris murray
#date 20220320
#nox server

FROM ubuntu:20.04
LABEL maintainer="cmurray@927.technology"

ENV version=0.7
ENV DEBIAN_FRONTEND=noninteractive

#update system
RUN apt update
RUN apt upgrade -y

#install nox
RUN useradd nox
RUN mkdir -p /home/nox/.config/qBittorrent
RUN touch /home/nox/.config/qBittorrent/qBittorrent.conf
RUN chown -R nox:nox /home/nox
RUN chmod -R 770 /home/nox
RUN apt install -y qbittorrent-nox gettext
#RUN mkdir -p /torrent
#RUN chown nox:nox /torrent
#RUN chmod 550 /torrent

#set container user
USER nox

#EXPOSE 8080/tcp

#entrypoint
COPY usr/local/bin/entrypoint.sh /usr/local/bin/
ENTRYPOINT /usr/local/bin/entrypoint.sh
