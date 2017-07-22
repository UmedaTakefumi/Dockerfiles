#!/bin/bash

# 元となるイメージとハッシュ値
download_ubuntu_xenial="https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-root.tar.gz"
download_ubuntu_xenial_md5sum="https://cloud-images.ubuntu.com/xenial/current/MD5SUMS"
ubuntu_xenial_filename="xenial-server-cloudimg-amd64-root.tar.gz"

# 作業用のディレクトリ

#if [ ! -d $working_dir ]; then
#  echo "作業用のディレクトリを作成します..."
#  mkdir -p $working_dir
#else
#  echo ""
#fi

echo "base imageをダウンロードします..."
wget -O $ubuntu_xenial_filename $download_ubuntu_xenial
wget $download_ubuntu_xenial_md5sum

#cat MD5SUMS | grep $ubuntu_xenial_filename
ubuntu_xenial_md5sum=$(cat MD5SUMS | grep $ubuntu_xenial_filename | awk '{ print $1 }')
echo $ubuntu_xenial_md5sum
ubuntu_xenial_md5sum_check=$(md5sum $ubuntu_xenial_filename | awk '{ print $1 }')
echo $ubuntu_xenial_md5sum_check

if [ "$ubuntu_xenial_md5sum" != "$ubuntu_xenial_md5sum_check" ]; then
  echo "ハッシュ値が、一致しません。スクリプトを終了します..."
  exit
fi

sudo docker build -t ubuntu/16.04 .

#cat $ubuntu_xenial_filename | sudo docker import - ubuntu-xenial
#cd ../; rm -r baseimage

# 情報源
#  http://qiita.com/erscl/items/359f295b38aea97b7b0b

