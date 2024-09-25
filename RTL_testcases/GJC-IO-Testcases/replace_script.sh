 
#!/bin/bash

file_path=$(find . -type f -iname "raptor_run.sh")

for i in $file_path; do
  
    sed -i 's/command -v raptor/# command -v raptor/g' $i
    sed -i 's/parse_cga exit/# parse_cga exit/g' $i

done