#!/bin/sh
sudo yum install -y git
cd /home/ec2-user
git clone https://github.com/katiabondartw/grepinternet.git

cd grepinternet/src/
./dnldandgrep.sh $1
