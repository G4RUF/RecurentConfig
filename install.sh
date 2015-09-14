###############################################################################
#
# File Name         : install.sh
# Created By        : Guillaume FAVRE
# Creation Date     : juin 23th, 2015
# Version           : 0.1
# Last Change       : September 14th, 2015 at 10:48:21
# Last Changed By   : Guillaume FAVRE
# Purpose           : Description
#
###############################################################################
#!/usr/bin/bash

#Function to download different files
if [ $(id -u) = 0 ]; then
	listPrograms='bash xorg gnome3 vim firefox libreoffice hping'
	for program in $listPrograms; do
		echo "Install " $program   
		pkg install --yes $program
		case $program in
		'gnome3')
		gdm=$(cat /etc/rc.conf | grep 'gdm')
		gnome=$(cat /etc/rc.conf | grep 'gnome')
		if [ "$gdm" != 'gdm_enable="YES"']; then
			echo 'gdm_enable="YES"' >> /etc/rc.conf
		fi
		if [ "$gnome" != 'gnome_enable="YES"']; then
			echo 'gnome_enable="YES"' >> /etc/rc.conf
		fi
		;;
		'bash')
		chsh -s /usr/local/bin/bash root
		;;
		esac
	done
	bash init.sh
else
	echo "Root mode necessary"
fi
