#!/bin/bash

#compass compile --force

rm controls_ha_utils.txt

find ./www ./FHEM -type f \( ! -iname ".*" \) -print0 | while IFS= read -r -d '' f;
do
    out="UPD "$(stat -f "%Sm" -t "%Y-%m-%d_%T" $f)" "$(stat -f%z $f)" ${f}"
    echo ${out//.\//} >> controls_ha_utils.txt
done

# CHANGED file
echo "FHEM haus-automatisierung.com custom theme last changes:" > CHANGED
echo $(date +"%Y-%m-%d") >> CHANGED
git log -n 10 --reverse --pretty="format:- %s" >> CHANGED
