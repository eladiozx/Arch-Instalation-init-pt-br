#!/bin/bash
time=`ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime; hwclock --systohc`

lang_pt=`echo LANG=pt_BR.UTF-8 >> /etc/locale.conf`


keymap=`echo KEYMAP=br-abnt2 >> /etc/vconsole.conf`

echo -e "\nInforme um nome ao hostname:"
 read name_host
  hostname=`echo $name_host >> /etc/hostname`
   hosts1=`echo 127.0.0.1 localhost.localdomain localhost >> /etc/hosts`
    hosts2=`echo ::1 localhost.localdomain localhost >> /etc/hosts`
     host3=`echo 112.0.0.1 $name_host.localdomain $name_host >> /etc/hosts`

echo -e "Instalar o Grub?"
 grub=`pacman -S grub os-prober`

echo "Informe a Partição de Instalação da Grub"
 read disc
  grub_install=`grub-install $disc; grub-mkconfig -o /boot/grub/grub.cfg`


echo -e "\n\nInisira uma nova senha ao Root:\n"
 password=`passwd`

echo -e "\nDeseja criar um novo usuario?(ESCREVA true ou false)\n"
read condition

if $condition;
 then
 echo -e "\n===== Criar novo usuario =====\n"

 echo "Informe um nome ao usuario:"
  read name_user;
   create_user=`useradd -m -g users -G wheel $name_user`

 echo -e "\nInsira uma senha ao usuario:"
  password=`passwd $name_user`
  
 echo -e "INSTALAR SUDO"
  sudo=`pacman -S sudo`
  sudoers=`echo $name_user ALL=(ALL) ALL >> /etc/sudoers`

fi
echo -e '\n\nCONFIGURAÇÃO FINALIZADA!!!\n'
echo "Bye ;)"

