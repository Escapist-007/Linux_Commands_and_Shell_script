#!/usr/bin/env bash

########################################################################
#  (@)rpdManager.sh
#
# NAME	 rpdManager
#
# DESC 	 This script helps to manage the online "rpd" file of BI server in OBIEE 12C
#
# AUTHOR Md Moniruzzaman Monir
#
########################################################################


		# ----------------------------------
		#     User defined function
		# ----------------------------------


# function to fetch the online rpd file of "BI server"(In Server machine) to My pc(local Machine)

rpdDownloader(){

        
}

# function to Upload the offline rpd file to "BI server"(In server machine) from My pc (local Machine)

rpdUploader(){
	
}


# function to transfer the online rpd file of one BI server(remote server) to another BI server(remote server)

rpdTransferer(){
	echo "Transferring ..."
}


# function to display different options

showOptions() {
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - O P T I O N S"
	echo "~~~~~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Download online RPD file from BI server(remote machine) to my pc"
	echo "2. Upload offline RPD file from my pc to BI server(remote machine)"
	echo "3. Transfer onile RPD file from one remote BI server to another remote BI server"
	echo "4. Quit"
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
		3) rpdTransferer ;;
		4) exit 0;;
		*) echo "Incorrect choice"
	esac
}
 
# function calling

showOptions
readChoice
