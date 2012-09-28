#!/bin/bash
# init
# Author: Samuel Haruna
# Created: 01/07/2012
# Last Update: 28/09/2012

codeigniter="http://codeigniter.com/download.php"
bootstrap="http://twitter.github.com/bootstrap/assets/bootstrap.zip"
foundation="http://foundation.zurb.com/files/foundation3.zip"
CURRENT=`PWD`
CI_PATH=`find ~/ \( -name "CodeIgniter*.zip" \) -print -quit`

echo "<=====================================>"
echo "CodeIgniter Scaffolding Generator v0.1"
echo "Linux/Mac OS CI Installer"
echo "By GrimVealt."
echo "<=====================================>"
echo ""

# Wait for one second
function pause(){
	sleep 1
}

function finish(){
	echo "Cleaning Up..."

	# Check which folders were downloaded and perform clean up
	if [[ -f "bootstrap.zip" ]]; then
		echo "Removing bootstrap.zip"
		`rm bootstrap.zip`
	fi
	pause
	if [[ -d "bootstrap" ]]; then
		echo "Removing Bootstrap"
		`rm -r bootstrap`
	fi
	pause
	if [[ -d "foundation3" ]]; then
		echo "Removing Foundation3"
		`rm -r foundation3`
	fi
	pause
	if [[ -f "foundation3.zip" ]]; then
		echo "Removing foundation.zip"
		`rm foundation3.zip`
	fi
	pause
	if [[ -f "CodeIgniter_2.1.2.zip" ]]; then
		echo "Removing CodeIgniter.zip"
		`rm CodeIgniter_2.1.2.zip`
	fi
	pause
	if [[ -d "__MACOSX" ]]; then
		echo "Removing __MACOSX"
		`rm -r __MACOSX`
	fi
	pause

	if [[ -d "$DNAME" ]]; then
		echo ""
		echo "Changing to Project Directory: $DNAME"
		cd $DNAME
		echo "In Directory - ` pwd`"
		echo "--------------------------"
		echo "Do you want to install sparks (yes{y}/no{n})?"
		read resp
		if [[ $resp == "y" ]] || [[ $resp == "yes" ]]; then
			echo "Installing Sparks"
			php -r "$(curl -fsSL http://getsparks.org/go-sparks)"
			echo ""
			echo "SPARKS HELP"
			echo "-----------"
			php tools/spark help
		else
			echo "Exiting"
		fi

	fi
}
#check if CodeIgniter Exists
function checkCi(){
	unamestr=`uname`
	
	echo "Checking for existing CodeIgniter zip."
	echo "--------------------------------------"
	echo ""
	#check if there is an existing CI zip
	if [[ -f "$CI_PATH" ]]; then
		echo "Detecting OS..."
		if [[ "$unamestr" == "Linux" ]]; then
			echo "Detected Linux"

		elif [[ "$unamestr" == "Darwin" ]]; then
			echo "Detected Mac OS"
		else
			echo "Could not detect your OS."
		fi
		echo "Found $CI_PATH"
		echo "Copying $CI_PATH to `pwd`"
		`cp $CI_PATH $CURRENT` #copy CI zip to current working directory
	
	else
		echo "CodeIgniter zip file wasn't found"
		echo "Detecting OS..."
		if [[ "$unamestr" == "Linux" ]]; then
			echo "Detected Linux"
			echo "Download CodeIgniter"

			read resp
			if [[ $resp == "y" ]] || [[ $resp == "yes" ]]; then
				`xdg-open $codeigniter`
			fi

		elif [[ "$unamestr" == "Darwin" ]]; then
			echo "Detected Mac OS"
			echo "Download CodeIgniter(y/n)"
			read resp
			if [[ $resp == "y" ]] || [[ $resp == "yes" ]]; then
				`open $codeigniter`
			fi
		else
			echo "Cannot detect your OS."
			echo "Exiting."
			exit 0
		fi
	fi
}
# Download and Install CodeIgniter with Boostrap From Twitter
function boot(){
	checkCi
	#echo "Downloading Lastest Copy of CodeIgniter"
	#`curl -O $codeigniter`
	pause
	echo "Unzipping CodeIgniter"
	echo ""

	# Check if CodeIgniter was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "CodeIgniter_2.1.2.zip" ]]; then
		`tar -xzvf CodeIgniter_2.1.2.zip`
		`mv CodeIgniter_2.1.2 $DNAME`
		`chmod 755 $DNAME`
	fi

	#Download Bootstrap From Twitter
	echo "Downloading Lastest Bootstrap"
	`curl -O $bootstrap`
	pause
	echo "Unzipping Bootstrap"
	echo ""

	# Check if Bootstrap was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "bootstrap.zip" ]]; then
		`tar -xzvf bootstrap.zip`
		`chmod 755 bootstrap`
	fi

	#copy assets to project folder
	`cp -r bootstrap/* $DNAME`
	finish
}

# Download and Install CodeIgniter with Foundation
function found(){
	checkCi
	#echo "Downloading Lastest Copy of CodeIgniter"
	#`curl -O $codeigniter`
	pause
	echo "Unzipping CodeIgniter"
	echo ""
	# Check if CodeIgniter was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "CodeIgniter_2.1.2.zip" ]]; then
		`tar -xzvf CodeIgniter_2.1.2.zip`
		`mv CodeIgniter_2.1.2 $DNAME`
		`chmod 755 $DNAME`
	fi

	echo "Downloading Lastest Foundation"
	`curl -O $foundation`
	pause
	echo "Unzipping Foundation"
	echo ""

	# Check if Foundation was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "foundation3.zip" ]]; then
		`tar -xzvf foundation3.zip`
		`chmod 755 foundation3`
	fi

	#copy assets to project folder
	`cp -r foundation3/images $DNAME`
	`cp -r foundation3/stylesheets $DNAME`
	`cp -r foundation3/javascripts $DNAME`

	finish
}

# Download and Install CodeIgniter with both Bootstrap & Foundation
function multi(){
	checkCi
	#echo "Downloading Lastest Copy of CodeIgniter"
	#`curl -O $codeigniter`
	pause
	echo "Unzipping CodeIgniter"
	echo ""
	# Check if CodeIgniter was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "CodeIgniter_2.1.2.zip" ]]; then
		`tar -xzvf CodeIgniter_2.1.2.zip`
		`mv CodeIgniter_2.1.2 $DNAME`
		`chmod 755 $DNAME`
	fi

	echo "Downloading Lastest Bootstrap"
	`curl -O $bootstrap`
	pause
	echo "Unzipping Bootstrap"
	echo ""
	# Check if Bootstrap was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "bootstrap.zip" ]]; then
		`tar -xzvf bootstrap.zip`
		`chmod 755 bootstrap`
	fi

	echo "Downloading Lastest Foundation"
	`curl -O $foundation`
	pause
	echo "Unzipping Foundation"
	echo ""
	# Check if Foundation was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "foundation3.zip" ]]; then
		`tar -xzvf foundation3.zip`
		`chmod 755 foundation3`
	fi

	#copy assets to project folder
	`cp -r bootstrap/* $DNAME`
	`cp -r foundation3/images $DNAME`
	`cp -r foundation3/stylesheets $DNAME`
	`cp -r foundation3/javascripts $DNAME`

	finish
}
# Download and Install CodeIgniter with no CSS Framework
function noframe(){
	checkCi
	echo "Waiting for 5 seconds"
	for i in {1..5}; do
		echo -n "$i "
		pause
	done
	echo ""

	echo ""
	# Check if CodeIgniter was downloaded and unzip it and rename it
	# & change the permissions
	if [[ -f "CodeIgniter_2.1.2.zip" ]]; then
		echo "Unzipping CodeIgniter"
		`tar -xzvf CodeIgniter_2.1.2.zip`
		`mv CodeIgniter_2.1.2 $DNAME`
		`chmod 755 $DNAME`
		break
	else
		echo "CodeIgniter is not in the current working directory."
		break
	fi	

	# `curl -O $codeigniter`

	finish
}

# Ask for user input to install CI and Frameworks
function manual(){
	echo "CWD: `pwd`"
	echo "Enter Project Name "
	read DNAME

	echo "Working"
	echo ""

	echo "Choose CSS Framework"
	echo "0. For No CSS Framework"
	echo "1. For Bootstrap, From Twitter"
	echo "2. For Foundation By Zurb"
	echo "3. To download both"

	# Get user input and call function
	while read choice
	do
		if [[ $choice -eq 1 ]]; then
			boot
			echo "Created $DNAME"
			break

		elif [[ $choice -eq 2 ]]; then
			found
			echo "Created $DNAME"
			break

		elif [[ $choice -eq 3 ]]; then
			multi
			echo "Created $DNAME"
			break

		elif [[ $choice -eq 0 ]]; then
			noframe
			break
		else
			echo "You made an Inccorrect choice"
			break
		fi
	done
}
# Uninstall Ignite
function remove(){
	echo "Uninstalling Ignite..."
	pause
	`sudo unlink /usr/bin/ignite`
	`sudo rm /usr/bin/ignite.sh`
	echo "Thanks for using ignite."
}

function showhelp(){
	echo "Ignite is a simple tool to automatically download and install"
	echo "CodeIgniter along with a CSS Framework like Bootstrap or Foundation."
	echo ""
	echo "Type 'ignite' to run or Type 'ignite -o [OPTION] [DIRECTORY]"
	echo "Where 'DIRECTORY' is the name of your project"
	echo ""
	echo "Type 'ignite rmv' to uninstall"
	echo ""
	echo "Type 'ignite --help' for help"
	echo ""
	echo "OPTIONS"
	echo -e "\t 'found', to install CI with Foundation by Zurb"
	echo -e "\t 'boot', to install CI with Bootstrap From Twitter"
	echo -e "\t 'both', to install CI with both Foundation by Zurb && Bootstrap From Twitter"
	echo -e "\t 'nf', to install CI with no CSS Framework"
}

# Check if ignite is installed
if [[ ! -f "/usr/bin/ignite.sh" ]]; then
	echo "Do you want to install ignite? (yes{y}/no{n})"
	read resp

	# If user wants to install
	if [[ $resp == "y" ]] || [[ $resp == "yes" ]]; then
		echo "Copied 'ignite.sh' to /usr/bin/"
		`sudo cp ignite.sh /usr/bin`
		pause
		echo "Created Link to 'ignite' from /usr/bin/"
		`sudo ln -s ignite.sh /usr/bin/ignite`
		echo "Installation Complete"
		echo "Type 'ignite --help' for help"
		exit 0
	else
		echo "Skipping Installation"
	fi
fi

# Check if more than 1 argument supplied
if [[ $# -ge 1 ]]; then
	arg=$1

	# Check what the argument is 
	if [[ $arg == "rmv" ]]; then
		remove
		exit 0
	
	elif [[ $arg == "--help" ]]; then
		showhelp
		exit 0
	
	elif [[ $arg == "-o" ]]; then
		arg2=$2
		if [[ $arg2 == "boot" ]]; then
			DNAME=$3
			echo "CWD: `pwd`"
			boot
			echo "Created $DNAME with Bootstrap"
			exit 0
		
		elif [[ $arg2 == "found" ]]; then
			DNAME=$3
			echo "CWD: `pwd`"
			found
			echo "Created $DNAME with Foundation"
			exit 0
		
		elif [[ $arg2 == "both" ]]; then
			DNAME=$3
			echo "CWD: `pwd`"
			multi
			echo "Created $DNAME with Foundation & Bootstrap"
			exit 0
		
		elif [[ $arg2 == "nf" ]]; then
			DNAME=$3
			echo "CWD: `pwd`"
			noframe
			echo "Created $DNAME with No Framework"
			exit 0
		else
			echo "Type 'ignite --help' for help"
			exit 0
		fi
	
	else
		echo "Type 'ignite --help' for help"
		exit 0
	fi

# If no argument supplied call manual
elif [[ $# -eq 0 ]]; then
	manual
fi
