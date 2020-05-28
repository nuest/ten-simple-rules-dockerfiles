#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#DEBUG TOOLS
#systemctl list-units | grep refine
#journalctl -u refine.service

# OpenRefine installer script

apt-get update &&
apt-get install -y wget ant unzip openjdk-8-jre-headless &&
apt-get clean -y

#OPENREFINEGZ="openrefine-linux-2.8.tar.gz"
#OPENREFINESRC="https://github.com/OpenRefine/OpenRefine/releases/download/2.8/openrefine-linux-2.8.tar.gz"
#OPENREFINEGZ="openrefine-linux-3.0-beta.tar.gz"
#OPENREFINESRC="https://github.com/OpenRefine/OpenRefine/releases/download/3.0-beta/openrefine-linux-3.0-beta.tar.gz"
OPENREFINEGZ="openrefine-linux-3.2.tar.gz"
OPENREFINESRC="https://github.com/OpenRefine/OpenRefine/releases/download/3.2/openrefine-linux-3.2.tar.gz"

OPENREFINE_DIR=/vagrant/openrefine_projects
mkdir -p $OPENREFINE_DIR
chown $OPENREFINE_USER:$OPENREFINE_GID $OPENREFINE_DIR

echo ""
echo ""
echo "**************************************************************"
echo "*************       Setting up OpenRefine        *************"
echo "**************************************************************"
echo ""
echo ""

#Prep for download
mkdir -p /opt
mkdir -p /root

if [ ! -f /opt/openrefine.done ]; then
	echo "Downloading OpenRefine..."
	if [ ! -f $THISDIR/root/$OPENREFINEGZ ]; then
		/usr/bin/wget -q --no-check-certificate  -P /root $OPENREFINESRC
	else
		cp $THISDIR/root/$OPENREFINEGZ /root/$OPENREFINEGZ
	fi
	echo "...downloaded OpenRefine"

	echo "Unpacking OpenRefine..."
	tar -xzf /root/$OPENREFINEGZ -C /opt  && rm /root/$OPENREFINEGZ
	#Unpacks to: /opt/openrefine-2.7
	touch /opt/openrefine.done
	echo "...unpacked OpenRefine"
else
	echo "...already downloaded and unpacked OpenRefine"
fi


#If not the Docker build, set up the services
#Note - the correct path needs to be set in the .service definition files
if [[ -z "${DOCKERBUILD}" ]]; then

	if [[ -z "${AUTHBUILD}" ]]; then
		cp $THISDIR/services/refine.service /lib/systemd/system/refine.service
	else
		cp $THISDIR/services/refine_auth.service /lib/systemd/system/refine.service
	fi

	# Enable autostart
	systemctl enable refine.service

	# Refresh service config
	systemctl daemon-reload

	#(Re)start service
	systemctl restart refine.service
fi


echo ""
echo ""
echo "**************************************************************"
echo "*************    DONE: setting up OpenRefine     *************"
echo "**************************************************************"
echo ""
echo ""