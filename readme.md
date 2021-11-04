ConfigServer Security & Firewall (CSF) for Hestia Control Panel (HestiaCP)

1) Install CSF for HestiaCP (Default) Whiout any config

cd /usr/src; rm -fv csf.tgz csf.tar.gz; apt install -y wget rename tar curl; wget -4 https://github.com/carlosfriascf/CSF-HestiaCP/raw/main/csf.tar.gz; tar -xzf csf.tar.gz; cd csf; sh install.hestia.sh;

OR

2) Install CSF for HestiaCP (Configured & optimized)

cd /usr/src; rm -fv csf.tgz csf.tar.gz; apt install -y wget rename tar curl; wget -4 https://github.com/carlosfriascf/CSF-HestiaCP/raw/main/csf.tar.gz; tar -xzf csf.tar.gz; cd csf; sh install.hestia.sh; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.conf -O /etc/csf/csf.conf; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.allow -O /etc/csf/csf.allow; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.ignore -O /etc/csf/csf.ignore; /usr/bin/wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/regex.custom.pm -O /usr/local/csf/bin/regex.custom.pm; /usr/bin/ln -s /usr/local/csf/bin/regex.custom.pm /etc/csf; systemctl enable csf; systemctl enable lfd; systemctl restart csf; systemctl restart lfd; csf -x; csf -e;

Note: The SSH configured port in the optimized configuration are 22, 2222 and 22022 & HestiaCP under 8083 only (Warning) need modification in /etc/csf/csf.conf on custom ports

Enjoy!
