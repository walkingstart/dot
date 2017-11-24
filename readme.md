# dot
一、分区及安装基本系统

检测uefi 
 ls /sys/firmware/efi/efivars
没有输出就是bios启动
1、Cfdisk  

  mkfs.ext4 /dev/sda9    boot    100m

  mkfs.ext4 /dev/sda10   /

  mkfs.ext4 /dev/sda11   home   

  mkswap /dev/sda12    

  swapon /dev/sda12    

 "EF00" in gdisk, "1 - EFI System" in modern fdisk, "esp" in parted/GParted,
  添加uefi分区
  大小512M 
  mkfs.vfat /dev/sdax
  mount /dev/sdax /mnt/boot/efi

2、mount /dev/sda10 /mnt    

  mkdir /mnt/boot && mount /dev/sda9 /mnt/boot

  mkdir /mnt/home && mount /dev/sda11 /mnt/home   

3、vi /etc/pacman.d/mirrorlist

4、dhcpcd   

5、pacstrap /mnt base base-devel
也可以pacstrap /mnt bash filesystem grub-bios linux pacman procps-ng syslog-ng glibc systemd-sysvcompat shawd dhcpcd vim sed(netctl dialog wpa_supplicant  无线)

6、  genfstab -p /mnt >>/mnt/etc/fstab

7、  arch-chroot /mnt

二、对新的基本系统进行设置
1、  vi /etc/hostname
     echo aaa >/etc/hostname  

2、  vi /etc/timezone
     写入时区：Asia/Shanghai    ln -s /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

3、  vi /etc/locale.conf
        LANG=en_US.UTF-8

4、vi /etc/locale.gen

5、locale-gen

6、 hwclock --systohc --utc

7、双系统
  
  pacman -S grub　os-prober (dosfstools efibootmgr UEFI驱动）　
  
  grub-install --recheck  /dev/sda　(提示error:cannot find EFI dirctory grub-install --recheck /dev/sda --efi-directory=/boot 或grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck --debug)　
 
  grub-mkconfig -o /boot/grub/grub.cfg

 # uefi系统 
 pacman -S dosfstools grub efibootmgr
 grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck 
 grub-mkconfig -o /boot/grub/grub.cfg
    
 单系统      
   pacman -S grub-bios
   
   grub-install /dev/sda
   
   grub-mkconfig -o /boot/grub/grub.cfg
  BIOS系统
   pacman -S grub os-prober
  grub-install --target=i386-pc /dev/<目标磁盘>
  grub-mkconfig -o /boot/grub/grub.cfg

8、 mkinitcpio -p linux

9、  passwd

10、 systemctl enable dhcpcd@.service

11、exit

12、umount /mnt/{boot,home,}   

13、reboot        

14、pacman -Syu

15、pacman -S  xorg-server xorg-xinit lightdm i3  wqy-zenhei xf86-video-显卡 tar  gvfs gvfs-mtp  vim git zsh volumeicon xorg-xrandr ttf-dejavu alsa-utils ctags adobe-source-han-sans-cn-fonts

16、  useradd -m 新用户
      passwd 新用户
      usermod –a –G video,audio,lp,log,wheel,optical,scanner,games,users,storage,power 新用户

17、 一些必备的软件 firefox firefox-i18n-zh-cn flashplugin pcmanfm  gpicview wqy-microhei ttf-arphic-ukai ttf-arphic-uming file-roller unrar zip unzip p7zip  feh lxappearance  ntfs-3g fcitx termite  

18、  ttf-font-awesome ttf-font-icons (i3-gaps 状态栏显示图标）

19、　la-capitaine-icon-theme arc-gtk-theme
