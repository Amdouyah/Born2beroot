echo "#Architecture:" $(uname -a)
echo "#CPU physical :" $(cat /proc/cpuinfo | grep 'physical id' | uniq | wc -l)
echo "#vCPU :" $(nproc)
echo "#Memory Usage :" $(free --mega | grep Mem | awk '{printf("%d/%dMB (%.2f%%)"), $3,$2, $3/$2*100}')
echo "#Disk Usage :" $(df -Bg --total | grep total | awk '{printf("%d/%dGb (%s)"), $3*1024, $4 ,$5}')
echo "#CPU load:" $(top -n1 | grep Cpu | awk '{printf("%.1f%%", $2)}')
echo "#last boot:" $(who -b | awk '{printf "%s %s", $3, $4}')
echo "#LVM use:" $(lsblk | grep lvm | wc -l | awk '{if($1 >0){print "yes"}else{print "no"}}')
echo "#Connections TCP :" $(ss -s | awk 'NR==7' | awk '{print $3}') ESTABLISHED
echo "#User log:" $(who | awk '{print($1)}' | uniq | wc -l)
echo "#Network: IP" $(hostname -i) $(ip addr show | grep ether | awk '{printf("(%s)", $2)}')
echo "Sudo :" $(journalctl -q | grep COMMAND | wc -l) cmd
