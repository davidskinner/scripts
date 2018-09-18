#!/usr/bin/expect

#cu.sh - for updating the SQL script on your server

#put the name of your SQL file in between the quotes below
set fileName "" #p.sql 

#make sure to include the directory the file is goin in if you
#have made a folder, that is the: ~/bacon
set logInfo "" #blaah@church.csce.uark.edu:~/bacon
set passWord "" #passsswooord

#----------------DO NOT TOUCH---------------------------#
eval spawn scp $fileName $logInfo
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$passWord\r"
interact
#----------------DO NOT TOUCH---------------------------#
sleep .5
#cr.sh - for running the SQL script on your church server

#make sure you: chmod 777 yourSQLScriptNameHere so that
#you have permission to run it

#the file that is sitting on your server to run
set fileName "" #p.sql
set logInfo "" #bacon@church.csce.uark.edu
set logOracle "" #dbclass90/oraclePassword@localhost:49161/xe
set passWord "" #uarkPassword

#----------------DO NOT TOUCH---------------------------#
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no $logInfo
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$passWord\r"
interact -o -nobuffer -re $prompt return
send "cd bacon\r"
interact -o -nobuffer -re $prompt return
send "rlwrap sqlplus $logOracle @$fileName\r"
interact -o -nobuffer -re $prompt return
send "exit\r"
sleep 1
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
#----------------DO NOT TOUCH---------------------------#
