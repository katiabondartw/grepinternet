#!/bin/sh
sudo yum install -y git
cd /home/ec2-user
git clone https://github.com/katiabondartw/grepinternet.git

mkdir res
cd grepinternet/src/
./dnldandgrep.sh $1
