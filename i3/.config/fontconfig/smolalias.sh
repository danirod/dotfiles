#!/bin/bash

# This script repeats a FontConfig block to disable antialiasing
# on certain fonts when the size is small. Change the list of fonts
# in the fonts variable, run the script, and paste the output in
# the fonts.conf file.

fonts=(
	"Andale Mono" "Arial" "Comic Sans MS"
	"Courier New" "Georgia" "Impact" "Times New Roman"
	"Trebuchet MS" "Verdana" "Webdings"
)

for ((i = 0; i < ${#fonts[@]}; i++)); do
	cat << EOF
  <match target="font">
    <test name="family">
      <string>${fonts[$i]}</string>
    </test>
    <test name="pixelsize" compare="less_eq">
      <double>14</double>
    </test>
    <edit name="antialias">
      <bool>false</bool>
    </edit>
  </match>
EOF
done
