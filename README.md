# NetTest

These scripts are created for testing network connectivity on Linux (built around Ubuntu) and if the network connectivity is down it will reboot the server.
This script will run the test every 10 minutes and log, If it finds the machine offline it will then log and reboot the box.

log are located in
/etc/log/OLearys/NetTest/

log names:

NetTest.log - This is to confirm the test is running every 10 minutes
NetTest_Online.log - when the machine is online it logs 
NetTest_Offline.log - Logs here when the machine is offline
