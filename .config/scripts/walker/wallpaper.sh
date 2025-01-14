list=$(find -L "/home/bypass/Pictures/Wallpapers/catppuccin/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" \))

while walls= read -r path; do
  printf "image=$path;label=$(basename $path);exec=swww img $path;\n"
done <<< "$list"
