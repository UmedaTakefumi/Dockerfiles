From ubuntu:xenial 
From 16.04-develop

RUN useradd -ms /bin/bash umetake

WORKDIR /home/umetake
USER umetake

RUN git clone https://github.com/riywo/ndenv ~/.ndenv
RUN git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
RUN echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(ndenv init -)"' >> ~/.bash_profile

RUN exec $SHELL -l

RUN ndenv rehash
RUN ndenv install v6.11.1

RUN ndenv rehash
RUN ndenv local v6.11.1

RUN npm install --save-dev gitbook-cli









