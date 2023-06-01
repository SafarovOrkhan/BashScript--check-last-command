#!/bin/bash
# storing previous command in variable
commandoutput=$( cat ~/.bash_history | tail -n2 | head -n1 | sed s/^/""/g )

echo "Your Command : $commandoutput"

# STDERR and STDOUT
$commandoutput 2> ~/com-error.log > ~/com-success.log

# variables to check log files
errorraw=$(wc -c ~/com-error.log)
successraw=$(wc -c ~/com-success.log)
error=$(echo "$errorraw" | awk '{print $1}')
success=$(echo "$successraw" | awk '{print $1}')

# condition
if [ "$error" -eq 0 ];
then
        echo "SUCCESS : This command executed succesfully"
else
        if [ "$success" -eq 0 ];
        then
                echo "ERROR : This command encountered an error "
        else
                echo "CAUTION : This comand encountered an error, but executed successfully"
        fi
fi

# deleting temporary folders
rm -rf ~/com-error.log ~/com-success.log
