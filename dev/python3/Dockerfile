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

CMD ["/bin/bash"]




