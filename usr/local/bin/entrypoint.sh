#!/bin/bash

#create config file if missing
[ -d /home/nox/config/qBittorrent ] || mkdir -p /home/nox/config/qBittorrent

#validate env variables
#[ -z ${nox_password} ] && echo password blank, do nothing
[ -z ${nox_ipaddr} ] && export nox_ipaddr=*
[ -z ${nox_port} ] && export nox_port=8080
[ -z ${nox_username} ] && export nox_username=admin
[ -z ${nox_password} ] && export nox_password= || export nox_password="@ByteArray(${nox_password})"

#create config file
envsubst << EOF > /home/nox/.config/qBittorrent/qBittorrent.conf
[AutoRun]
enabled=false
program=

[BitTorrent]
Session\CreateTorrentSubfolder=true
Session\DisableAutoTMMByDefault=true
Session\DisableAutoTMMTriggers\CategoryChanged=false
Session\DisableAutoTMMTriggers\CategorySavePathChanged=true
Session\DisableAutoTMMTriggers\DefaultSavePathChanged=true

[Core]
AutoDeleteAddedTorrentFile=Never

[Network]
Cookies=@Invalid()

[Preferences]
Advanced\AnonymousMode=true
Bittorrent\AddTrackers=false
Bittorrent\Encryption=1
Bittorrent\MaxRatioAction=0
Bittorrent\PeX=true
Connection\GlobalDLLimitAlt=0
Connection\GlobalUPLimitAlt=0
Connection\Interface=${nox_if}
Connection\alt_speeds_on=true
Downloads\PreAllocation=false
Downloads\SavePath=/torrent
Downloads\ScanDirsV2=@Variant(\0\0\0\x1c\0\0\0\0)
Downloads\StartInPause=false
DynDNS\DomainName=changeme.dyndns.org
DynDNS\Enabled=false
DynDNS\Password=
DynDNS\Service=0
DynDNS\Username=
General\Locale=en
General\UseRandomPort=false
MailNotification\email=
MailNotification\enabled=false
MailNotification\password=
MailNotification\req_auth=true
MailNotification\req_ssl=false
MailNotification\sender=qBittorrent_notification@example.com
MailNotification\smtp_server=smtp.changeme.com
MailNotification\username=
Queueing\MaxActiveDownloads=25
Queueing\MaxActiveTorrents=20
Queueing\MaxActiveUploads=1
WebUI\Address=${nox_ipaddr}
WebUI\AlternativeUIEnabled=false
WebUI\AuthSubnetWhitelist=@Invalid()
WebUI\AuthSubnetWhitelistEnabled=false
WebUI\CSRFProtection=true
WebUI\ClickjackingProtection=true
WebUI\HTTPS\Enabled=false
WebUI\HostHeaderValidation=true
WebUI\LocalHostAuth=true
WebUI\Password_PBKDF2=
WebUI\Password_ha1=${nox_password}
WebUI\Port=${nox_port}
WebUI\RootFolder=

WebUI\ServerDomains=*
WebUI\UseUPnP=true
WebUI\Username=admin
EOF

#start nox
echo "y\n" | /usr/bin/qbittorrent-nox
