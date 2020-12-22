#!/bin/bash
echo `clear`
# Usage: license
#Copyright (c) 2020 Abbas Haroon

#Permission is hereby granted, free of charge, to any person obtaining
#a copy of this software and associated documentation files (the
#\"Software\"), to deal in the Software without restriction, including
#without limitation the rights to use, copy, modify, merge, publish,
#distribute, sublicense, and/or sell copies of the Software, and to
#permit persons to whom the Software is furnished to do so, subject to
#the following conditions:

#The above copyright notice and this permission notice shall be
#included in all copies or substantial portions of the Software.
#THE SOFTWARE IS PROVIDED \"AS IS\", WITHOUT WARRANTY OF ANY KIND,
#EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
#MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
#NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
#LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
#OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
#WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE."



# Define SSH Accounts and assign them to a variable
#Example:
#  Name:      A name to use and identify an account
#  Ip/Host:   Ip/Host of the server to connect to 
#  User:      SSH User
#  Port:      The port on which the client will connect with ssh
#  Key:       SSH key to login, if no key is provided then user will be promoted for a password
#
#
#         Name      Ip/Host      User    Port Key File Path
#server1=("hosting2" "google.com" "root2" 22   "/var/key2.pem")
example=("hosting"  "127.0.0.1"  "root"  ""   "")

#Then add each of above server variable as item to MAIN_ARRAY below e.g variable[@]
MAIN_ARRAY=(
#  server1[@]
  example[@]
)
  



echo "Available Servers:"
# Loop and print it.  Using offset and length to extract values
COUNT=${#MAIN_ARRAY[@]}




for ((i=0; i<$COUNT; i++))
do
  vName=${!MAIN_ARRAY[i]:0:1}
  vIp=${!MAIN_ARRAY[i]:1:1}
  vUser=${!MAIN_ARRAY[i]:2:1}
  vPort=${!MAIN_ARRAY[i]:3:1}
  echo "${i}. ${vName} ${vUser}@${vIp}"

done


read -p "Choose a server by entering it's id/name: " choosenServer







for ((i=0; i<$COUNT; i++))
do


  vName=${!MAIN_ARRAY[i]:0:1}


  if [ $vName = $choosenServer ] || [ $i = $choosenServer ]
  then
      connectServer=${i}
  fi
done



cName="${!MAIN_ARRAY[connectServer]:0:1}"
cIp="${!MAIN_ARRAY[connectServer]:1:1}"
cUser="${!MAIN_ARRAY[connectServer]:2:1}"
cPort="${!MAIN_ARRAY[connectServer]:3:1}"
cPath="${!MAIN_ARRAY[connectServer]:4:1}"
if [ -z $cName ]
then
  echo -n "Server Name Not Found"
  read cName
fi
if [ -z $cIp ]
then
    echo -n "Ip Not Found. Please Provide One: "
    read cIp
fi
if  [ -z $cUser ]
then
    echo -n "Server User Not Found. Please Provide One: "
    read cUser
fi
if  [ -z $cPort ]
then
    echo -n "Port not Set. Please provide one or press Enter for Default(22): "
    read cPort
    if [ -z $cPort ]
    then
      cPort=22
    fi
fi
if  [ -z $cPath ]
then
#  echo "Key file not found!"
  echo "Running: ssh ${cUser}@${cIp} -p ${cPort}"
  ssh "${cUser}@${cIp}" \-p "${cPort}"
else
echo "Running: ssh ${cUser}@${cIp} -i ${cPath} -p ${cPort}"
ssh "${cUser}@${cIp}" \-i "${cPath}" \-p "${cPort}"
fi
