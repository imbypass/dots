Sel=$(find -L "/home/bypass/Pictures/Wallpapers/" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" -o -iname "*.webp" \))

while IFS= read -r path; do
    printf "label=$path;exec=swww img $path;image=$path;recalculate_score=true\n"
done <<< "$Sel"
