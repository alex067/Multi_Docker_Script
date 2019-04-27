#!/bin/bash
###############################
#Run a docker command over multiple scripts
#c_arg defines parent folder name
#s_arg defines child folder name within c_arg that contains scripts to run
#Created by Alexandros Panayi
################################
c_arg=$1
COMMAND=$2

if [ $# -eq 0 ] ; then
  echo "Please supply the folder name, and either a docker command or a script containing a docker command." 

else
  if [ -z "$1" ] ; then
    echo "Please supply the folder name."
  fi
  
  if [ -z "$2" ] ; then
    echo "Please supply the docker command, or a script containing a docker command."
    
  else
    COMMAND=${COMMAND/c_arg/$c_arg}
    
    declare -a script_arr
    for file in $c_arg/*; do
      script_arr=(${script_arr[@]} "${file##*/}")
    done

    echo "Beginning to execute docker commands on folder $c_arg."

    for scripts in ${script_arr[@]}; do
      if [[ -f $COMMAND ]] ; then
        $COMMAND $c_arg $scripts
      else
        run_command=${COMMAND/s_arg/$scripts}
        $run_command
		echo $run_command
      sleep 2
      fi
    done
  fi
fi
