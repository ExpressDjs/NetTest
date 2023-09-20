#!/bin/bash
# Created by Denis O'Leary to install and setup NetTest application

_date=$(date +"%T-%d/%m/%y");
_hn=(hostname);

#Checking for root user
if [ "$EUID" -ne 0 ]
	then echo "Please run as root"
	exit
fi

if [ -d "/etc/OLeary/" ]
	then echo "Folder is created " && sudo cp check_reboot.sh /etc/OLeary
else
	echo "Creating folder and copying needed file" && sudo mkdir /etc/OLeary && sudo cp check_reboot.sh /etc/OLeary
fi


# echo "Coping the check_reboot document to the root of the server"
# sudo cp check_reboot.sh /

echo " "

echo " Creating the required cronjob for the check_reboot command"
sudo echo "*/10 * * * * root /etc/OLeary/check_reboot.sh" >> /etc/cron.d/check_reboot

echo "Creating log file rotation"
if [ -d "/etc/logrotate.d" ]
	then echo "LogRotate is installed, Copying file as required" && sudo cp NetTest.conf /etc/logrotate.d/ && sudo chmod 0644 /etc/logrotate.d/NetTest.conf
else
	echo "Please install log rotate and manually copy NetTest.conf to /etc/logrotate.d/"
fi

exit;
