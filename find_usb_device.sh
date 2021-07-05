cd /sys/bus/usb/devices
sysdir='/sys/bus/usb/devices'

file=$(grep  "10c4/ea60"  * -r)

echo "============================================="
echo $file
echo "============================================="

index=0
for i in $(echo $file | busybox awk '{print $1,$2}')
do
	arr[$index]=$i
	let "index+=1"
done

echo ${arr[0]}
echo ${arr[1]}

echo "============================================="

endpath="$sysdir/""${arr[0]}"

echo $endpath

echo "dirpath============================================="
dir_path=${endpath%/uevent*}
echo $dir_path
cd $dir_path
pwd

#url="http://c.biancheng.net/index.html"
#echo ${url%/*}  #结果为 http://c.biancheng.net
#tmp="/sys/bus/usb/devices1-4/1-4.3/uevent:PRODUCT=10c4/ea60/100"
#echo ${tmp%/uevent*}
