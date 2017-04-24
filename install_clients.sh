#!/bin/sh


server="$1"
if [ -z $server ];then
echo "Usage `basename $0` server";
exit 1;
fi

LDIR=$(pwd)
rsync -av /etc/yum.repos.d/salt-latest.repo $1:/etc/yum.repos.d/

ssh root@$server "grep 10.10.199.6 ~/.bashrc || echo 'http_proxy=http://10.10.199.6:3128;export http_proxy' >>~/.bashrc"
ssh root@$server "grep 10.10.199.6 /etc/yum.conf || echo 'proxy=http://10.10.199.6:3128' >>/etc/yum.conf"
ssh root@$server "yum install salt-minion -y; killall salt"
scp  $LDIR/minion.template root@$server:/etc/salt/minion
ssh root@$server "salt-minion -d"
