#!/bin/bash

#CONFIGURACAO DE TEMPO
time=`ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime; hwclock --systohc`

#CONFIGURACAO DE LINGUA
lang_pt=`echo LANG=pt_BR.UTF-8 >> /etc/locale.conf`

#CONFIFURAÇÃO DE TECLADO
keymap=`echo KEYMAP=br-abnt2 >> /etc/vconsole.conf`

#HOSTNAME
echo -e "\nInforme um nome ao hostname:"
 read name_host
  hostname=`echo $name_host >> /etc/hostname`
   hosts1=`echo 127.0.0.1 localhost.localdomain localhost >> /etc/hosts`
    hosts2=`echo ::1 localhost.localdomain localhost >> /etc/hosts`
     host3=`echo 112.0.0.1 $name_host.localdomain $name_host >> /etc/hosts`

#GRUB
echo -e "Instalar o Grub?"
 grub=`pacman -S grub os-prober`

echo "Informe a Partição de Instalação da Grub"
 read disc
  grub_install=`grub-install $disc; grub-mkconfig -o /boot/grub/grub.cfg`

#SENHA
echo -e "\n\nInisira uma nova senha ao Root:\n"
 password=`passwd`

#REDE
echo -e "\nInstalação de ferramentas de rede"
 rede=`pacman -S dhcpcd`

if `systemctl enable dhcpcd`
  then
     echo -e "REDE ATIVA ;)\n"
else
    echo -e "REDE NAO ATIVA :( \n"
fi
#NOVO USUARIO
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
  sudo_user="$name_user ALL=(ALL) ALL"
  sudoers=`echo $sudo_user >> /etc/sudoers`

fi

echo -e '\n\nCONFIGURACAO FINALIZADA!!!\n'
echo "Bye ;)"

