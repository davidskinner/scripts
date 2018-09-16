#!/usr/bin/expect

#cu.sh - for updating the SQL script on your server

#put the name of your SQL file in between the quotes below
set fileName "" #ex. p.sql

#make sure to include the directory the file is goin in if you
#have made a folder, that is the: ~/bacon
set logInfo "" #ex. bacon@church.csce.uark.edu:~/bacon
set passWord "" #ex. plzSendSSMS

#----------------DO NOT TOUCH---------------------------#
eval spawn scp $fileName $logInfo
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$passWord\r"
interact
#----------------DO NOT TOUCH---------------------------#
