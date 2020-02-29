#!/bin/bash

cp -r /usr/bin /usr/.tr/usr/bin
cd /usr && touch -r /bin/sh .tr .tr/usr .tr/usr/bin .tr/usr/bin/*

cp -r /bin /usr/.tr/bin
cd /usr && touch -r /bin/sh .tr .tr/bin .tr/bin/*

cp -r /usr/sbin /usr/.tr/usr/sbin
cd /usr && touch -r /bin/sh .tr .tr/usr .tr/usr/sbin .tr/usr/sbin/*
