#!/usr/bin/env bash

########################################################################
#  (@)rpdManager.sh
#
# NAME	  rpdManager
#
# DESC 	  This script helps to manage the online "rpd" file of BI server in OBIEE 12C
#
# AUTHOR  Md Moniruzzaman Monir
#
########################################################################


		# ----------------------------------
		#     User defined function
		# ----------------------------------


# function to fetch the online rpd file of "BI server"(In Server machine) to My pc(local Machine)

rpdDownloader(){

	# Input remote user & server's IP
	echo "Type remote USER name & press [ENTER]:"
	read remoteUSER
	echo "Type remote server's IP & press [ENTER]:"
	read remoteIP
       
        echo "Type NAME (only prefix) for the rpd file which will be downloaded & press [ENTER]:"
        read nameRPD


        rpdFILENAME="$nameRPD"_"$(date +%F_%H_%M).rpd"

	remoteLOCATION="$(sshpass -p 'therap123' ssh $remoteUSER@$remoteIP "locate datamodel.sh | grep domains")"
	remoteDIRECTORY=$(dirname $remoteLOCATION)
	
	# Login to remote server machine & run some commands
	sshpass -p 'therap123' ssh $remoteUSER@$remoteIP <<EOF
	 echo "Log into remote machine"
	 echo -n "Remote User:"
	 whoami 
	 echo " "

	 cd $remoteDIRECTORY
	 echo "Current location in remote machine:"
	 pwd
	 echo " "

	 # This commands run in the local machine 
	 echo "Local user: $(whoami)"
	 echo "Curent location in local machine: $(pwd)" 
          
	 ./datamodel.sh downloadrpd -O $rpdFILENAME -W biuser123 -SI ssi -U weblogic -P admin123
	 
	 exit
EOF
        
        if [[ -z "$remoteDIRECTORY" ]]; then
          echo "Remote login failed. Check if you have 'sshpass' installed in your pc."
          echo "Command for installing sshpass: sudo apt install sshpass"   
	else
	  echo "Log out from remote machine"
	  echo " "
	  echo "Fetching the downloaded rpd file from OBIEE SERVER to LOCAL machine"
	  scp $remoteUSER@$remoteIP:$remoteDIRECTORY/$rpdFILENAME .
	  echo " "
	  echo "Location of the rpd file in local machine:"
	  readlink -f $rpdFILENAME
	fi
        
}

# function to Upload the offline rpd file to "BI server"(In server machine) from My pc (local Machine)

rpdUploader(){

        # Input remote user & server's IP
	echo "Type remote USER name & press [ENTER]:"
	read remoteUSER
	echo "Type remote server's IP & press [ENTER]:"
	read remoteIP
	echo "Type remote location (ex: /home/oracle/rpd) where rpd file will be copied & press [ENTER]:"
	read remote_rpd_dir
	
	echo "Type name of the offline rpd file whcih will be uploaded & press [ENTER]:"
	read offlineRPD
	echo "Type directory of the offline rpd file & press [ENTER]:"
	read localDIR
	
	remoteLOCATION="$(sshpass -p 'therap123' ssh $remoteUSER@$remoteIP "locate datamodel.sh | grep domains")"
	remoteDIRECTORY=$(dirname $remoteLOCATION)
	
	cd $localDIR
	scp $offlineRPD $remoteUSER@$remoteIP:$remote_rpd_dir


	# Login to remote server machine & run some commands
	sshpass -p 'therap123' ssh $remoteUSER@$remoteIP <<EOF
	 echo "Log into remote machine"
	 echo -n "Remote User:"
	 whoami 
	 echo " "

	 cd $remoteDIRECTORY
	 echo "Current location in remote machine:"
	 pwd
	 echo " "

	 # This commands run in the local machine 
	 echo "Local user: $(whoami)"
	 echo "Curent location in local machine: $(pwd)" 

	 ./datamodel.sh uploadrpd -I $remote_rpd_dir/$offlineRPD -W biuser123 -U weblogic -P admin123 -SI ssi
	 
	 exit
EOF
	
}


# function to display different options

showOptions() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - O P T I O N S"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Download online RPD file from BI server(remote machine) to my pc"
	echo "2. Upload offline RPD file from my pc to BI server(remote machine)"
	echo "3. Quit"
}

# function to read user's choice

readChoice(){

	local choice
	echo " "
	echo "Please select an option : [1/2/3/4]"
	read choice
	case $choice in
		1) rpdDownloader ;;
		2) rpdUploader ;;
		3) exit 0;;
		*) echo "Incorrect choice"
	esac
}
 
# function calling

showOptions
readChoice
