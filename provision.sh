
#. /vagrant_config/install.env
echo "hello"
ifconfig -a
# echo -e "${ROOT_PASSWORD}\n${ROOT_PASSWORD}" | passwd
echo -e "password\npassword" | passwd
ssh-keygen -q -t rsa -N '' -f ~/.ssh/id_rsa <<<y >/dev/null 2>&1
 cat /root/keys/id_rsa.pub >> ~/.ssh/authorized_keys