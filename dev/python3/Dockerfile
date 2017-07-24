From ubuntu

RUN apt-get -y update
RUN apt-get -y install libgtk2.0-0 libgconf2-4 \
    libnss3 libasound2 libxtst6 libcanberra-gtk-module \
    libgl1-mesa-glx zip gcc g++ make openssl libssl-dev \
    libbz2-dev libreadline-dev libsqlite3-dev sqlite \ 
    gnupg curl apt-transport-https libxss1

RUN useradd -ms /bin/bash umetake

RUN curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
RUN mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

RUN apt-get -y update
RUN apt-get -y install code

RUN useradd -m umetake
RUN ln -s /proc/self/fd /dev/fd

WORKDIR /home/umetake
USER umetake

RUN git clone git://github.com/yyuu/pyenv.git .pyenv

ENV HOME  /home/umetake
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install 3.6.1
RUN pyenv global 3.6.1
RUN pyenv rehash

RUN pip install ptvsd







