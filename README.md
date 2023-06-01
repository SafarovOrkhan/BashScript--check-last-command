# BashScript--check-last-command
This script checks last command if it runned successfully or not. I am aware of "echo $?" command, I made this just for my learn practicing of bash scripting.

## How to use
first create an alias like this 
- alias check="history -w ; ~/script.sh"
- check script has x permission
- please note that yo must replace this "~" with the path where the script file is
- run any command 
- type "check" in command line
- it will give you results

## Some examples
```
[root@localhost ~]# echo "hello world"
hello world
[root@localhost ~]# check
Your Command : echo "hello world"
SUCCESS : This command executed succesfully
```
```
[root@localhost ~]# ls /nonexistingfile
ls: cannot access '/nonexistingfile': No such file or directory
[root@localhost ~]# check
Your Command : ls /nonexistingfile
ERROR : This command encountered an error 
```
```
[root@localhost ~]# ls mydir/ /nonexisting file
ls: cannot access '/nonexisting': No such file or directory
ls: cannot access 'file': No such file or directory
mydir/:
hosts
[root@localhost ~]# check
Your Command : ls mydir/ /nonexisting file
CAUTION : This comand encountered an error, but executed successfully
```

## Please note
- script does not recognise aliases
- script re-execute previous command. So it might duplicate process
