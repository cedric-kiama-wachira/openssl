systemctl stop appamor.service
systemctl disable appamor.service
apt-get remove apparmor -y

apt install selinux-basics auditd
vi /etc/default/grub
GRUB_CMDLINE_LINUX=" security=selinux"
sestatus
selinux-activate

sysctl reboot

ls -Z


