#!/usr/bin/expect

#cc.sh - for connecting to church ONLY

set logInfo "" #ex. halp@church.csce.uark.edu
set passWord "" #ex. aGoodUARKpassword

#----------------DO NOT TOUCH---------------------------#
eval spawn ssh -oStrictHostKeyChecking=no -oCheckHostIP=no $logInfo
#use correct prompt
set prompt ":|#|\\\$"
interact -o -nobuffer -re $prompt return
send "$passWord\r"
interact
#----------------DO NOT TOUCH---------------------------#
