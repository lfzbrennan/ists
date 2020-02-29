# change user password seperately

getent passwd | awk -F: '$3 > 999 {print $1 ":" $1 "9"}' | chpasswd /dev/stdin
