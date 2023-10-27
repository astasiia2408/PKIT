#!/bin/bash
directory=$1
original_extension=$2
new_extension=$3

for file in "$directory"/*."$original_extension"; do
      if [ -f "$file" ]; then
           file_Name=$(base_name "$file" ".$original_extension")

           new_fileName="$filename.$new_extension"

           mv "$file" "$directory/$new_filename"

           echo "Перейменовано $file на $new_fileName"

fi

done
