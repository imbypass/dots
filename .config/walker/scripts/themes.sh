list=$(flavours list | tr " " "\n")

while themes= read -r theme; do
  name=$(b=${theme##*/}; echo ${b%.*})

  printf "label=${name};exec=flavours apply $theme && ~/.local/bin/bde rl spotify\n"
done <<< "$list"
