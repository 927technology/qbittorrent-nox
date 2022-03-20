qBittorrent Nox Docker Container

Web based BitTorrent server

0.6
Distro Ubuntu 21.04
qBittorrent 4.2.5

Environmental Variables
nox_password - password already encrypted, leave blank for a password of 'adminadmin'
nox_ipaddr - address to listen on, by default should be *
nox_port - tcp port to listen on, by default should be 8080
nox_username - web username, by default shoud be admin

volume mounts
/torrent - default download location

docker cli
docker run --name nox --hostname nox -p 8080:8080 -v ./torrent:/torrent -e nox_password= -e nox_ipaddr=* nox_port=8080 -e nox_username=admin 927technology/qbittorrent-nox:0.6

docker-compose
cd to git root
docker-compose up -d
