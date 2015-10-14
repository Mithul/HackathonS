s=''
for i in $(cut -d: -f1 /etc/passwd)
do
      	s=$s' -e '$i
done
echo $s
while [ 1 ]
do
	sudo tail -3 /var/log/auth.log |  grep $s
	if $s != ''
	then
		echo 'null'
	else
		echo 'done'
	fi
done
