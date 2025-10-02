list=$(harmony-theme-list | tr " " "\n")

while themes= read -r theme; do
    name=$(b=${theme##*/}; echo ${b%.*});

    if [ "$name" == "$(harmony-theme-current)" ]; then
        name=" > $name"
    fi
    name=${name//-/ };
    disp=($name);
    name=${disp[@]^};

    printf "label=${name};exec=harmony-theme-set $theme\n"
done <<< "$list"
