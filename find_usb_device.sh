cd /sys/bus/usb/devices
sysdir='/sys/bus/usb/devices'

file=$(grep  "10c4/ea60"  * -r)

index=0
for i in $(echo $file | busybox awk '{print $1,$2}')
do
	arr[$index]=$i
	let "index+=1"
done

echo ${arr[0]}
echo ${arr[1]}


endpath="$sysdir/""${arr[0]}"

echo $endpath

dir_path=${endpath%/uevent*}
echo $dir_path
cd $dir_path
pwd


file=$(grep  "ttyUSB"  * -r)

index=0
for i in $(echo $file | busybox awk '{print $1,$2}')
do
	arr[$index]=$i
	let "index+=1"
done

echo ${arr[0]}
echo ${arr[1]}

endpath="$sysdir/""${arr[0]}"

echo $endpath
echo "ttyUSB result"
ttyUSB=${endpath##*DEVNAME=}
echo $ttyUSB
