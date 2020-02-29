#!/bin/bash

iptables -A FORWARD -j DROP
iptables -A INPUT -j DROP
iptables -A OUTPUT -p tcp --sport 22 -m tcp -j ACCEPT
iptables -A OUTPUT -j DROP
