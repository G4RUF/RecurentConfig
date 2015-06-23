###############################################################################
#
# File Name         : install.sh
# Created By        : Guillaume FAVRE
# Creation Date     : juin 23th, 2015
# Version           : 0.1
# Last Change       : juin 23th, 2015 at 16:11:19
# Last Changed By   : Guillaume FAVRE
# Purpose           : Description
#
###############################################################################
#!/usr/bin/bash

#Function to download different files
if [ $(id -u) = 0 ]; then
	listPrograms='xorg gnome3 vim firefox thunderbird libreoffice'
	for program in $listPrograms; do
		echo "Install " $program   
		pkg install --yes $program
		if [ program = 'gnome3' ]; then
			gdm=$(cat /etc/rc.conf | grep 'gdm')
			gnome=$(cat /etc/rc.conf | grep 'gnome')
		       	if [ "$gdm" != 'gdm_enable="YES"']; then
				echo 'gdm_enable="YES"' >> /etc/rc.conf
			fi
		       	if [ "$gnome" != 'gnome_enable="YES"']; then
				echo 'gnome_enable="YES"' >> /etc/rc.conf
			fi
		fi
	done
else
	echo "Root mode necessary"
fi
