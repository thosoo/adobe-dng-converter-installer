#!/bin/bash
if [ "$1" = "--help" ]; then
cat <<ENDOFHELP
Command Line Options

This script supports the following command line options:
	-p Specifies the $WINEPREFIX, where Adobe DNG Converter should be installed. Else, the default path $HOME/wine-dng will be used.
ENDOFHELP
	exit 1
fi


if [ $# -eq 0 ]; then
WINEPREFIX="$HOME/wine-dng"
echo "Settings default wineprefix $HOME/wine-dng"
fi

if [ "$1" = "-p" ] 
then
	WINEPREFIX="$2"
	echo "Setting wineprefix $2"
fi

if ! command -v wine &> /dev/null
then
    echo "wine could not be found, please install wine first."
    exit
fi

if [ -d "$WINEPREFIX" ]; then
  ### Take action if $DIR exists ###
  echo "Folder already exists"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Creating directory... $WINEPREFIX"
  mkdir $WINEPREFIX
fi

if ! command -v winetricks &> /dev/null
then
    echo "winetricks could not be found"
    while true; do
        read -p "Do you wish to install winetricks?" yn
        case $yn in
            [Yy]* ) wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks; chmod +x winetricks; sudo mv winetricks /usr/local/bin/; break;;
            [Nn]* ) exit;;
            * ) echo "Please answer yes or no.";;
        esac
    done
    echo "Executing winetricks.."
    winetricks settings win10
else
    echo "Executing winetricks.."
	winetricks settings win10    
fi
echo "Copy helper scripts to /usr/local/bin.."
sudo cp dngconverter /usr/local/bin
#13_1 has a bug in its installer..
DNGVER=13_0
echo "Downloading Adobe DNG Converter.."
wget http://download.adobe.com/pub/adobe/dng/win/DNGConverter_${DNGVER}.exe
/usr/local/bin/dngconverter -i DNGConverter_${DNGVER}.exe
rm -f DNGConverter_${DNGVER}.exe
echo "Adobe DNG Converter installed."
