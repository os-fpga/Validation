#!/bin/bash
number_of_parallel_threads=10
domain_path="RTL_testcases"
run_file_name="raptor_run.sh"
timeout="500"
synthesis=0     # 1 => run only upto synthesis, 0 => run till bistream
CV_ROOT=$PWD
export CV_ROOT

if [ -f "my_orig.txt" ] ; then
   rm -fR "my_orig.txt"
fi


find ./$domain_path -type f -iname $run_file_name>top.txt

# find inactive designs and remove from lise in top.txt
grep -rnw ./$domain_path -e '#Status:"inactive"'>inactive_testcases.txt
sed -i "s/test.config:3:#Status:\"inactive\"/$run_file_name/" inactive_testcases.txt
while read line; do
    sed -i 's,'"$line"',,' top.txt #find inactive testcases and replace with empty line
done < inactive_testcases.txt
sed -i '/^$/d' top.txt # delete empty line from file

while read line; do 
#     # echo $line
#    i=$((i+1))
   sed -i "1s/.\//\ncd \$CV_ROOT\//" top.txt
   arg=$(cat top.txt | sed -n '2p' )
   temp=${arg:3} #gets variable starting from 3rd index
#    echo $arg
#    echo $temp
   sed -i -e "2s~$run_file_name~\n$temp\ncd \$CV_ROOT~" top.txt
   head -n 4 top.txt >> active_designs.txt # copy first four line from top.txt to active_designs.txt
   sed -i '1,4d' top.txt # delete first four line from top.txt 
done < top.txt
rm -fR top.txt

sed -i "s/$run_file_name/$run_file_name 23 $timeout true GEMINI_COMPACT_104x68 $synthesis --batch/" active_designs.txt

line_count=$(wc -l < "active_designs.txt")
line_number=$((line_count / $number_of_parallel_threads))
# echo $line_number

is_line_empty() {
    local line=$1
    [ -z "$line" ]
}

while true; do
   current_line=$(sed -n "${line_number}p" "active_designs.txt")

   if is_line_empty "$current_line"; then
      lines=$((line_number - 1))

      for ((i=1; i<=$number_of_parallel_threads; i++)); do
         output_file="regg$i.sh"
         head -n "$lines" "active_designs.txt" > "$output_file"
         sed -i -e "1,${lines}d" "active_designs.txt"
      done

      rm -rf active_designs.txt

      echo "#!/bin/bash" > "reg_run1.sh"
      echo "" >> "reg_run1.sh"
      echo "chmod u+x" $(seq -f "regg%.0f.sh" -s " " 1 $number_of_parallel_threads) >> "reg_run1.sh"
      echo "" >> "reg_run1.sh"
      
      for ((i=1; i<=$number_of_parallel_threads; i++)); do
          echo "\$CV_ROOT/regg$i.sh &" >> "reg_run1.sh"
      done
      
      echo "" >> "reg_run1.sh"
      echo "wait" >> "reg_run1.sh"
      echo "echo \"completed\"" >> "reg_run1.sh"
      
      chmod +x "reg_run1.sh"
      break
   else
      line_number=$((line_number + 1))
      continue
   fi

   line_number=$((line_number + 1))
done

bash reg_run1.sh
