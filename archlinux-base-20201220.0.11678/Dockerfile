FROM archlinux:base-20201220.0.11678

ARG USERNAME=developer
ARG UID=10000
ARG GID=10000

RUN yes | pacman -Syu

## pacman -Syy git base-devel
## $ Enter a selection (default=all):
## 
## see also: https://www.archlinux.jp/groups/x86_64/base-devel/
RUN yes | pacman -S autoconf automake binutils bison fakeroot file findutils \
                    flex gawk gcc gettext grep groff gzip libtool m4 make \
                    pacman patch pkgconf sed sudo texinfo which

## Japanese setting
## see also: https://qiita.com/u1and0/items/88e3dd5efbdb0a496959 
ENV LANG="ja_JP.UTF8"\
    LC_NUMERIC="ja_JP.UTF8"\
    LC_TIME="ja_JP.UTF8"\
    LC_MONETARY="ja_JP.UTF8"\
    LC_PAPER="ja_JP.UTF8"\
    LC_MEASUREMENT="ja_JP.UTF8"
# Get reflector Server setting for faster download
# Same as `reflector --verbose --country Japan -l 10 --sort rate`

RUN echo "Build start with USERNAME: $USERNAME UID: $UID GID: $GID" &&\
    : "Add yay option" &&\
    echo '[multilib]' >> /etc/pacman.conf &&\
    echo 'Include = /etc/pacman.d/mirrorlist' >> /etc/pacman.conf &&\
    pacman -Sy &&\
    : "Add user ${USERNAME} for yay install" &&\
    groupadd -g ${GID} ${USERNAME} &&\
    useradd -u ${UID} -g ${GID} -m -s /bin/bash ${USERNAME} &&\
    passwd -d ${USERNAME} &&\
    mkdir -p /etc/sudoers.d &&\
    touch /etc/sudoers.d/${USERNAME} &&\
    echo "${USERNAME} ALL=(ALL) ALL" > /etc/sudoers.d/${USERNAME} &&\
    mkdir -p /home/${USERNAME}/.gnupg &&\
    echo 'standard-resolver' > /home/${USERNAME}/.gnupg/dirmngr.conf &&\
    chown -R ${USERNAME}:${USERNAME} /home/${USERNAME} &&\
    mkdir /build &&\
    chown -R ${USERNAME}:${USERNAME} /build

## My dotfiles
WORKDIR /home/${USERNAME}
USER ${USERNAME}



