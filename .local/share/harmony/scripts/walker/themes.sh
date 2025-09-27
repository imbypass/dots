list=$(flavours list | tr " " "\n")

while themes= read -r theme; do
    name=$(b=${theme##*/}; echo ${b%.*});

    if [ "$name" == "$(flavours current)" ]; then
        name=" > $name"
    fi
    name=${name//-/ };
    disp=($name);
    name=${disp[@]^};

    printf "label=${name};exec=harmonyctl colors $theme\n"
done <<< "$list"
