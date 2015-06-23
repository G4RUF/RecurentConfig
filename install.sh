###############################################################################
#
# File Name         : install.sh
# Created By        : Guillaume FAVRE
# Creation Date     : juin 23th, 2015
# Version           : 0.1
# Last Change       : juin 23th, 2015 at 12:08:54
# Last Changed By   : Guillaume FAVRE
# Purpose           : Description
#
###############################################################################
#!/usr/bin/bash

#Function to download different files
if [ "$user" = "root" ]; then
	listPrograms='xorg gnome3 vim firefox thunderbird libreoffice'
	for program in $listPrograms; do
		echo "Install " $program   
		pkg install --yes $program
	done
else
	echo "Root mode necessary"
fi
