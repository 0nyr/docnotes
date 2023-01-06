#!/bin/bash

# this file is used to move all directories from 100APPLE to 108APPLE from Kenzae to the hard drive

# colors
# NB - don't forget to use the -e flag when using colors with echo
LIGHT_ORANGE_COLOR="\e[38;5;216m"
LIGHT_BLUE_COLOR="\e[38;5;153m"
RED_COLOR="\e[38;5;196m"
NO_COLOR="\e[0m"

for filepath in /home/onyr/Documents/images/iphone_2020_08_12/DCIM/*APPLE 
do
	echo -e "${LIGHT_BLUE_COLOR}using mv to move ${filepath} to hard drive${NO_COLOR}"
	mv ${filepath} /media/onyr/1EA6A736A6A70CF9/2020_08_12_iphone_photos/DCIM	
done

