list=$(flavours list | tr " " "\n")

while themes= read -r theme; do
  name=$(b=${theme##*/}; echo ${b%.*});
  name=${name//-/ };
  disp=( $name );
  name=${disp[@]^};
  printf "label=${name};exec=notify-send -u low -a hyprland -t 750 \"Theme Applied\" \"Theme changed to:  ${name}\" && flavours apply $theme\n"
done <<< "$list"
