#!/usr/bin/expect

#cr.sh - for running the SQL script on your church server

#make sure you: chmod 777 yourSQLScriptNameHere so that
#you have permission to run it

#the file that is sitting on your server to run
set fileName "" #ex. p.sql
set logInfo "" #ex. halp@church.csce.uark.edu
set logOracle "" #ex. dbclass99/yourOraclePassword@localhost:49161/xe
set passWord "" #ex. IWantAnIDE

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
sleep .3
interact -o -nobuffer -re $prompt return
send "exit\r"
interact
#----------------DO NOT TOUCH---------------------------#
