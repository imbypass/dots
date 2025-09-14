list=$(flavours list | tr " " "\n")

while themes= read -r theme; do
  name=$(b=${theme##*/}; echo ${b%.*});
  name=${name//-/ };
  disp=( $name );
  name=${disp[@]^};
  printf "label=${name};exec=harmonyctl colors $theme && notify-send -u low -a hyprland -t 750 \"Harmony\" \"Theme changed to:  ${name}\" -i ~/.local/share/harmony/logo.svg\n"
done <<< "$list"
