#Disable SELINUX or AppArmor
vi /etc/selinux/config
SELINUX=disabled

wget https://go.dev/dl/go1.21.5.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.5.linux-amd64.tar.gz
vi /etc/profile
export PATH=/usr/local/go/bin:$PATH

apt update
apt install snapd
apt install fuse squashfuse
snap install hello-world

snap install lxd --channel=5.0/stable
lxd init
Would you like to use LXD clustering? (yes/no) [default=no]: 
Do you want to configure a new storage pool? (yes/no) [default=yes]: 
Name of the new storage pool [default=default]: 
Name of the storage backend to use (ceph, cephobject, dir, lvm, zfs, btrfs) [default=zfs]: 
Create a new ZFS pool? (yes/no) [default=yes]: 
Would you like to use an existing empty block device (e.g. a disk or partition)? (yes/no) [default=no]: 
Size in GiB of the new loop device (1GiB minimum) [default=5GiB]: 
Would you like to connect to a MAAS server? (yes/no) [default=no]: 
Would you like to create a new local network bridge? (yes/no) [default=yes]: 
What should the new bridge be called? [default=lxdbr0]: 
What IPv4 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
What IPv6 address should be used? (CIDR subnet notation, “auto” or “none”) [default=auto]: 
Would you like the LXD server to be available over the network? (yes/no) [default=no]: 
Would you like stale cached images to be updated automatically? (yes/no) [default=yes]: 
Would you like a YAML "lxd init" preseed to be printed? (yes/no) [default=no]:


wget https://public-kodekloud-course-assets.s3.amazonaws.com/ldap-server.tar.xz
lxc import ldap-server.tar.xz
lxc list

+-------------+---------+------+------+-----------+-----------+
|    NAME     |  STATE  | IPV4 | IPV6 |   TYPE    | SNAPSHOTS |
+-------------+---------+------+------+-----------+-----------+
| ldap-server | STOPPED |      |      | CONTAINER | 0         |
+-------------+---------+------+------+-----------+-----------+

lxc start ldap-server 
lxc list
+-------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
|    NAME     |  STATE  |         IPV4         |                     IPV6                      |   TYPE    | SNAPSHOTS |
+-------------+---------+----------------------+-----------------------------------------------+-----------+-----------+
| ldap-server | RUNNING | 10.38.159.218 (eth0) | fd42:3202:b0a5:e9e7:216:3eff:fe88:50e8 (eth0) | CONTAINER | 0         |
+-------------+---------+----------------------+-----------------------------------------------+-----------+-----------+

apt update && apt install libnss-ldapd -y

replace 127.0.0.1 with 10.38.159.218


