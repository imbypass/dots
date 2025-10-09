list=$(omarchy-theme-list)
echo $list

while themes= read -r theme; do
    name=$(b=${theme##*/}; echo ${b%.*});
    name=${theme//-/ };
    disp=($name);
    name=${disp[@]^};

    printf "label=${name};exec=omarchy-theme-set $theme\n"
done <<< "$list"
