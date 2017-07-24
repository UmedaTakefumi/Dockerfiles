# Dockerfile

## Dockerのインストール / Ubuntu 16.04 

```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce

sudo groupadd docker

sudo usermod -aG docker andrew-waldfeld
```

https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#os-requirements

## Dockerのインストール / MacOSX sierra

```
brew update
brew install docker
brew cask update
brew cask install docker
```



