#!/bin/bash

export DISPLAY=:0

XFT_SETTINGS="
Xft.antialias:  1
Xft.autohint:   0
Xft.dpi:        $1
Xft.hinting:    1
Xft.hintstyle:  hintfull
Xft.lcdfilter:  lcddefault
Xft.rgba:       rgb
"

echo "$XFT_SETTINGS" | xrdb -merge > /dev/null 2>&1
