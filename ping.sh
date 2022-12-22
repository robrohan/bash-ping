#!/bin/bash

output=pings.prom
hosts=`cat ./hosts.txt`

###################################
DEBUG=0
debug() {
    if [ $DEBUG -eq 1 ]; then 
        $@
    fi
}
###################################

for i in ${hosts[@]} ; do
    debug curl --connect-timeout 2 --max-time 5 -L $i
    debug echo "--------------"
    k=$(curl --connect-timeout 2 --max-time 5 -L $i &> /dev/null ; echo $?)
    end+=("custom_ping_handler{host=\"$i\"} $k")
done

first=${end[0]}
end=("${end[@]:1}")

echo "# $(date -u)" > $output
echo $first >> $output
for ((l = 0; l < ${#end[@]}; l++)); do
    echo "${end[$l]}" >> $output
done
