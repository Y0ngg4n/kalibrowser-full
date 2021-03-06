FROM kalilinux/kali-rolling

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && \
apt-get install -y \ 
net-tools \
openbox \
git \ 
x11vnc \
xvfb \
wget \
python \
python-numpy \
unzip \
geany && \
cd /root && git clone https://github.com/kanaka/noVNC.git && \
cd noVNC/utils && git clone https://github.com/kanaka/websockify websockify && \
cd /root
ADD startup.sh /startup.sh

RUN chmod 0755 /startup.sh && \
apt-get autoremove -y && \
rm -rf /var/lib/apt/lists/*

#The Kali Docker Image Is Out Of Date. : (
RUN apt-get update -y && apt-get dist-upgrade -y

RUN apt-get install -y kali-linux-everything

RUN apt-get install -y lxde-core lxde kali-defaults kali-root-login desktop-base

CMD /startup.sh
