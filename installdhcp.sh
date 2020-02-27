apt-get install build-essential python3-dev python3-pip python3-cffi libcairo2 libpango-1.0-0 libpangocairo-1.0-0 libgdk-pixbuf2.0-0 libffi-dev shared-mime-info

apt-get install *net-tools* -y 
#sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
echo "PermitRootLogin yes" >>/etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd
echo -e "root:passw0rd" | chpasswd 

