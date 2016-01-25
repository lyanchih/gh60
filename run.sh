#!/bin/bash

if [ ! -f keymap.eep ]; then
    echo "Plase offer keymap eep file"
    exit 1
fi

if ! dfu-programmer atmega32u4 erase --debug 5; then
    echo "Please enable flash"
    exit 1
fi

if [ ! -z "$1" ]; then
    dfu-programmer atmega32u4 flash gh60_Amj60.hex --debug 5
fi

dfu-programmer atmega32u4 flash-eeprom keymap.eep --debug 5

dfu-programmer atmega32u4 start --debug 5 
