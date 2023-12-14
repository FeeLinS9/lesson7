sudo -i
cd /root
yum install -y \
redhat-lsb-core \
wget \
rpmdevtools \
rpm-build \
createrepo \
yum-utils \
gcc
wget https://nginx.org/packages/centos/8/SRPMS/nginx-1.20.2-1.el8.ngx.src.rpm
rpm -i nginx-1.*
wget https://github.com/openssl/openssl/archive/refs/heads/OpenSSL_1_1_1-stable.zip
unzip OpenSSL_1_1_1-stable.zip
mv openssl-OpenSSL_1_1_1-stable /root/openssl
yum-builddep /root/rpmbuild/SPECS/nginx.spec -y
wget -O /root/rpmbuild/SPECS/nginx.spec https://raw.githubusercontent.com/FeeLinS9/lesson7/master/nginx.spec
rpmbuild -bb /root/rpmbuild/SPECS/nginx.spec
yum localinstall -y \/root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm
systemctl start nginx
mkdir /usr/share/nginx/html/repo
cp /root/rpmbuild/RPMS/x86_64/nginx-1.20.2-1.el8.ngx.x86_64.rpm /usr/share/nginx/html/repo
wget https://downloads.percona.com/downloads/percona-distribution-mysql-ps/percona-distribution-mysql-ps-8.1.0/binary/redhat/8/x86_64/percona-orchestrator-3.2.6-11.el8.x86_64.rpm -O /usr/share/nginx/html/repo/percona-orchestrator-3.2.6-11.el8.x86_64.rpm
createrepo /usr/share/nginx/html/repo/
wget -O /etc/nginx/conf.d/default.conf https://raw.githubusercontent.com/FeeLinS9/lesson7/master/default.conf
nginx -s reload
cat >> /etc/yum.repos.d/otus.repo << EOF
[otus]
name=otus-linux
baseurl=http://localhost/repo
gpgcheck=0
enabled=1
EOF
yum repolist enabled | grep otus
echo "Устанавливаем percona orchestrator из своего репозитория"
yum install percona-orchestrator.x86_64 -y
exit