# bash_alpine3.8

## usage

[sh-framework(shell-script)](https://github.com/UmedaTakefumi/sh-framework)

## requirement

## online-build

```
git clone https://github.com/UmedaTakefumi/bash_alpine3.8.git
cd bash_alpine3.8.git
docker build -t bash:alpine3.8 .
```

## Run

```
docker run -it bash:alpine3.8
```

### Run / docker switch to root

```
docker run -u root -it bash:alpine3.8 
```


