 


# Get the name of the current directory
current_directory=$(basename "$PWD")

log=./fr_run_summary.log

totalran=`find -name "raptor.log" |sort --unique | wc -l`
echo "found all runs"
allcomp=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "SYN:\|PAC:\|RTE:\|TIM:\|ANL:\|BIT:" | wc -l`
echo "found all compile error"
anl=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "ANL:" | wc -l`
echo "found analyze error"
syn=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "SYN:" | wc -l `
syn_dlatch=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "DLATCH" | wc -l`
syn_mem=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "no valid mapping found for memory" | wc -l`
syn_dff=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "Generic DFFs" | wc -l `
echo "found all synthesis error"
pac=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "PAC: Design" | wc -l `
echo "found all packing error"
rte=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "RTE:" | wc -l`
echo "found all routing error"
tim=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "TIM:" | wc -l`
echo "found all sta error"
bit=`find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "ERROR:" | grep "BIT:" | wc -l`
echo "found all bitstream error"
pssim=`find -name "post_synth_sim.log" |sort --unique | xargs grep "ERROR:" | wc -l `
echo "found all post_synthesis simulation error"

totalfail=`expr $allcomp + $pssim`
totalpass=`expr $totalran - $totalfail`

echo -e "\n" > $log
echo "Total test ran: $totalran" >> $log
echo "Total Compile failures: $allcomp" >> $log
echo "          ANL Failures: $anl" >> $log
echo "          SYN Failures: $syn" >> $log
echo "                        SYN DLATCH Failures: $syn_dlatch" >> $log
echo "                        SYN mem mapping Failures: $syn_mem" >> $log
echo "                        SYN Async SR Failures: $syn_dff" >> $log
echo "          PAC Failures: $pac" >> $log
echo "          RTE Failures: $rte" >> $log
echo "          BIT Failures: $bit" >> $log
echo "          TIM Failures: $tim" >> $log
echo "Total Post Synth Sim Failures: $pssim" >> $log

# echo "Date, Total ran, Total Pass, Total Fail, Comp fail, ANL fail, Syn fail, Syn DLATCH fail, Syn mem map fail, syn async sr fail, PAC fail, RTE fail, BIT fail, TIM fail, post synth sim fail," >> $log
# echo "$ts, $totalran, $totalpass, $totalfail, $allcomp, $anl, $syn, $syn_dlatch, $syn_mem, $syn_dff, $pac, $rte, $bit, $tim, $pssim," >> $log

echo -e "\n" >> $log
echo -e "\n" >> $log

echo "======================================================" >> $log
echo "-------    all compile failure logs    ---------------" >> $log
echo "======================================================" >> $log
echo -e "\n" >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "ANL:" -B1 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "SYN:" -B2 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "PAC: Design" -B1 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "RTE:" -B1 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "BIT:" -B1 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log
find -name "raptor.log" |sort --unique | xargs grep -l "ERROR:" | sort --unique | xargs tail -n20 | grep "==>\|ERROR:" | grep "TIM:" -B1 | sed "s~==> .~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}~g" | sed 's/==/==========/g'  >> $log

echo -e "\n" >> $log
echo -e "\n" >> $log
echo -e "\n" >> $log
echo "======================================================" >> $log
echo "---    all post synth simulation failure logs    -----" >> $log
echo "======================================================" >> $log
echo -e "\n" >> $log
find -name "post_synth_sim.log" | sort --unique | xargs grep "ERROR:" | awk -F ":ERROR:" '{printf "%s\nERROR:%s\n\n", $1, $2}' | sed "s~^\./~==> https://cga.rapidsilicon.com/wwwroot/toolslog/parsed_logs/${current_directory}/~g" $1 | sed 's/post_synth_sim.log/post_synth_sim.log <==/g' | sed 's/==/==========/g' >> $log

cat $log

