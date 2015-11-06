a=`du -h /root/log_backups/* | awk '{print $1 }' | tr -d "M"`
for i in $a;
  do 
    b=`bc <<< "$i/5"`;
    printf "%0.s." `seq 1 $b`; 
    printf "$i\n"; 
  done;
