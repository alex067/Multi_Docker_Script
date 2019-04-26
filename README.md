### Multi_Docker_Script

Lets you run the same docker command over multiple sources.

#For example: 
In your parent directory, you have a folder that contains scripts that need to be ran in a docker container. 
All the scripts are ran through the same docker run command. 

parent folder > "process" folder > 
"scripts 1" folder > main.py
"scripts 2" folder > main.py
"scripts 3" folder > main.py
"scripts 4" folder > main.py

Place the run_all.sh script inside your parent directory.

Run the script as:
./run_all.sh <folder name> <docker command> OR <script that runs a docker commmand>

<docker command> must use keywords #c_arg to name the process folder, and $s_arg to name the scripts folder.

#For example:
Using the example above:
./run_all.sh proccess "docker run -t custom_container python3 c_arg/s_arg/main.py" 
OR 
./run_all.sh processs "docker run -t custom_container ./custom_script c_arg s_arg" 

