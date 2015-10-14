s=''
for i in $(cut -d: -f1 /etc/passwd)
do
      	s=$s' -e '$i
done
echo $s
while inotifywait -q -e modify /var/log/auth.log > /dev/null; do
	echo "filename is changed"
	op=`sudo tail -3 /var/log/auth.log |  grep $s -o --color`
        echo $op
	s='?users='
	for j in $op
	do
		s=$s$j','
	done
	echo $s
	curl localhost:3000/userTrack$s
done
