list=$(harmony-font-list)

while fontss= read -r font; do
    name=$(b=${font##*/}; echo ${b%.*});

    if [ "$name" == "$(harmony-font-current)" ]; then
        name=" > $name"
    fi

    printf "label=${name};exec=harmony-font-set \"${font}\"\n"
done <<< "$list"
