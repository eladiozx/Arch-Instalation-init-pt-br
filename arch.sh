#!/bin/bash
time=`ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime; hwclock --systohc`
lang_pt=`echo LANG=pt_BR.UTF-8 >> /etc/locale.conf`
keymap=`echo KEYMAP=br-abnt2 >> /etc/vconsole.conf`
hostname=`arch`
hosts1=`echo 127.0.0.1 localhost.localdomain localhost >> /etc/hosts`
hosts2=`echo ::1 localhost.localdomain localhost >> /etc/hosts`
host3=`echo 112.0.0.1 arch.localdomain arch >> /etc/hosts`
mkinit=`mkinitcpio -P`
