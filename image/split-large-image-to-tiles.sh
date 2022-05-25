#!/bin/bash

filename='world-map.jpg'
folder="."
file="$folder/$filename"
background='white'

image_width=$(convert $file -ping -format "%w" info:)
image_height=$(convert $file -ping -format "%h" info:)
echo -e "image: \n\twidth = ${image_width}px,\theight = ${image_height}px"

# https://www.toptenreviews.com/what-photo-size-is-a4
# A4: 3510 x 2490, A5: 2490 x 1740, ...

## landscape
mode='LANDSCAPE'
default_page_width=3510
default_page_height=2490

# ## portrait
# mode='PORTRAIT'
# default_page_width=2490
# default_page_height=3510

## split by columns
columns=3
actual_page_width=$(echo "scale=2; $image_width / $columns + 0.5" | bc | xargs printf "%.*f\n" "0")
actual_page_height=$(echo "scale=2; $actual_page_width / $default_page_width * $default_page_height + 0.5" | bc | xargs printf "%.*f\n" "0")
rows=$(echo "scale=2; $image_height / $actual_page_height + 0.5" | bc | xargs printf "%.*f\n" "0")
method='COLUMN'

# # ## split by rows
# rows=2
# actual_page_height=$(echo "scale=2; $image_height / $rows + 0.5" | bc | xargs printf "%.*f\n" "0")
# actual_page_width=$(echo "scale=2; $actual_page_height / $default_page_height * $default_page_width + 0.5" | bc | xargs printf "%.*f\n" "0")
# columns=$(echo "scale=2; $image_width / $actual_page_width + 0.5" | bc | xargs printf "%.*f\n" "0")
# method='ROW'

echo "split image in the [$mode] mode by [$method]: "
echo -e "\twidth = ${actual_page_width}px,\theight = ${actual_page_height}px"
echo -e "\tcolumns = $columns,\trows = $rows"

## DO IT
rm -rf ${folder}/parts-*.jpg

convert ${file} \
    -crop ${actual_page_width}x${actual_page_height} \
    -extent ${actual_page_width}x${actual_page_height} \
    -background $background \
    parts-%02d.jpg

convert "parts-*.jpg" -quality 100 output.pdf
