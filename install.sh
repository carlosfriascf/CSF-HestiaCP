#!/bin/sh -x
cd /usr/src; rm -fv csf.tgz csf.tar.gz; apt install -y wget rename tar curl; wget -4 https://github.com/carlosfriascf/CSF-HestiaCP/raw/main/csf.tar.gz; tar -xzf csf.tar.gz; cd csf; sh install.hestia.sh; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.conf -O /etc/csf/csf.conf; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/cloudflare.allow -O /etc/csf/cloudflare.allow; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.allow -O /etc/csf/csf.allow; wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/csf.ignore -O /etc/csf/csf.ignore; /usr/bin/wget -4 https://raw.githubusercontent.com/carlosfriascf/CSF-HestiaCP/main/regex.custom.pm -O /usr/local/csf/bin/regex.custom.pm; /usr/bin/ln -s /usr/local/csf/bin/regex.custom.pm /etc/csf; systemctl enable csf; systemctl enable lfd; systemctl restart csf; systemctl restart lfd; csf -x; csf -e;
