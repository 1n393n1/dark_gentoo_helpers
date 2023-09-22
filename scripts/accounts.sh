#!/usr/bin/sudo bash

echo "Creating additional accounts"
read -p "Select a number: 1.React 2.Vue 3.Angular 4.Preact    _ " number

templateFunc () {
  echo -n "Creating $1 account -> "
  read -p "New user name    _ " name
  echo $1$name
  useradd -m -G audio,cdrom,floppy,portage,usb,video,users,wheel -s /bin/bash $1$name
  echo -n "Created $1 account -> $1$name with home folder"
  cat /etc/passwd
  sudo cp -r /home/templaten3/Z.ide /home/$1$name/Z.ide
  sudo cp /home/templaten3/.bashrc /home/$1$name
  echo -n "Edit /home/$1$name/.bashrc"
  echo -n "Correct paths."
  read -p "New user $1$name password"
  passwd $1$name
  echo -n "Bye!!! All Done."

  echo "Hello $1 $2"
}

case $number in

  1)
    templateFunc "react"
    ;;

  2)
    templateFunc "vue"
    ;;

  3)
    templateFunc "angular"
    ;;

  4)
    templateFunc "preact"
    ;;
  *)
    echo -n "OLX"
    ;;
esac
