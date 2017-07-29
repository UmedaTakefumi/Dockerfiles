From ubuntu:xenial 
From 16.04-develop

RUN useradd -ms /bin/bash umetake

WORKDIR /home/umetake
USER umetake

RUN git clone https://github.com/riywo/ndenv ~/.ndenv
RUN git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
RUN echo 'export PATH="$HOME/.ndenv/bin:$PATH"' >> ~/.bash_profile
RUN echo 'eval "$(ndenv init -)"' >> ~/.bash_profile

#RUN exec $SHELL -l
ENV PATH .ndenv/shims:.ndenv/bin:$PATH

RUN echo $PATH

RUN ndenv rehash
RUN ndenv install v6.11.1

RUN ndenv rehash
RUN ndenv local v6.11.1

RUN npm install gitbook-cli -g

RUN npm install --save-dev gitbook-cli

RUN mkdir DocData
RUN cd DocData
RUN gitbook init

ADD book.json /home/umetake/
ADD index.js.patch /home/umetake/node_modules/gitbook-plugin-mermaid-2/index.js
RUN cd /home/umetake/node_modules/gitbook-plugin-mermaid-2/
RUN patch -u < index.js.patch





