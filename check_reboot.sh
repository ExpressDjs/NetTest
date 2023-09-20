#!/bin/bash
# Created by Denis O'Leary to test for connectivy and reboot if required
# Verison 1.2 (04/10/2022)

_DIP=$(/sbin/ip route | awk '/default/ { print $3 }')
_date=$(date +"%m-%d-%y %H:%M:%S");


#Check for root
if [ "$EUID" -ne 0 ]
	then echo "Pleae run as root"
	exit
fi

#Creating first log folder if needed
if [ -d "/var/log/OLearys/" ]
	then echo "OLearys log folder is created "
else
	echo "Creating the log folder as required for this test" && mkdir /var/log/OLearys/
fi

#creating log file for test
if [ -d "/var/log/OLearys/NetTest" ]
	then echo "Test ran at" $_date >> /var/log/OLearys/NetTest/NetTest.log
else
	echo "Creating folder" && mkdir /var/log/OLearys/NetTest && echo "Test ran at" $_date >> /var/log/OLearys/NetTest/NetTest.log
fi

ping -c 1 $_DIP > /dev/null
if [ $? -ne 0 ];
	then echo $_date ": Offline, Server is being rebooted" >> /var/log/OLearys/NetTest/NetTest_Offline.log && /sbin/shutdown -r now
else
	echo $_date ": Test ran and compleated at" >> /var/log/OLearys/NetTest/NetTest_Online.log

fi

exit
