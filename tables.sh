#!/bin/bash


if [[ $# -eq 0 ]]; then
	echo "Usage: ./script.sh <port_num1> <port_num2> ..."
	exit
fi

echo "Deleting existing rules..."
iptables -F
iptables -A FORWARD -j DROP
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m conntrack --ctstate ESTABLISHED -j ACCEPT
iptables -A OUTPUT -m icmp -j ACCEPT 
iptables -A INPUT -m icmp -j ACCEPT

echo "Allowing ingress and egress traffic through given ports"

for portnum in $*
do
	echo "Setting port $portnum"
	iptables -A INPUT -p tcp --dport $portnum -m tcp -j ACCEPT
	iptables -A OUTPUT -p tcp --sport $portnum -m tcp -j ACCEPT
done

echo "Denying access to all other ports..."
iptables -P INPUT DROP
iptables -P OUTPUT DROP
