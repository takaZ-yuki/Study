#!/bin/sh
sudo yum update -y
sudo yum install -y epel-release
sudo yum install -y ansible sshpass
sshpass -p 'vagrant' ssh -o StrictHostKeyChecking=no vagrant@127.0.0.1 command exit
touch hosts
touch /vagrant/httpd-playbook.yml
sudo touch /vagrant/index.html
echo "[local]
127.0.0.1" > hosts
echo "---
- hosts: local
  become: yes
  tasks:
    - name: Apacheをインストール
      yum: name=httpd state=installed
    - name: Apacheサービスを起動 ＆ 自動起動化
      service: name=httpd state=started enabled=yes
    - name: Fire Wallの80番ポートを開ける
      firewalld: port=80/tcp permanent=true state=enabled
    - name: Fire Wallを再起動
      service: name=firewalld state=restarted
    - name: SELinax 停止
      selinux: state=disabled
    - name: /var/www/htmlを削除
      command: rm -rf /var/www/html
    - name: /var/www/html → /vagrant をシンボリックリンクに設定
      command: ln -fs /vagrant /var/www/html" > /vagrant/httpd-playbook.yml
ansible-playbook -i hosts /vagrant/httpd-playbook.yml --ask-pass
echo "<h1>Hello World!!</h1>" > /vagrant/index.html
