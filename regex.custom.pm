#!/usr/bin/perl
###############################################################################
# Copyright 2006-2018, Way to the Web Limited
# URL: http://www.configserver.com
# Email: sales@waytotheweb.com
###############################################################################

sub custom_line {
        my $line = shift;
        my $lgfile = shift;

if (($globlogs{CUSTOM1_LOG}{$lgfile}) and ($line =~ /.*access forbidden by rule(\S+).*/)) {
    return ("access forbidden by rule",$1,"nginx_sec","6","80,443,8080,8083,8443","86400","0");
}

if (($globlogs{CUSTOM1_LOG}{$lgfile}) and ($line =~ /(\S+).*] "POST \/wp-login\.php.*" 200/)) {
    return ("failed WordPress login",$1,"wordpress","6","80,443,8080,8083,8443","3600","0");
}

if (($globlogs{CUSTOM1_LOG}{$lgfile}) and ($line =~ /(\S+) -.*[GET|POST|HEAD].*( 403)/)) {
    return ("Nginx 403",$1,"nginx_403","30","80,443,8080,8083,8443","86400","0");
}

if (($globlogs{CUSTOM3_LOG}{$lgfile}) and ($line =~ /(\S+) -.*[GET|POST|HEAD].*( 403)/)) {
    return ("Nginx 403",$1,"nginx_403","30","80,443,8080,8083,8443","86400","0");
}

if (($globlogs{CUSTOM1_LOG}{$lgfile}) and ($line =~ /.*limiting connections by zone .*, client: (\S+),(.*)/)) {
    return ("NGINX Security rule triggered from",$1,"nginx_conn_limit","6","80,443,8080,8083,8443","86400","0");
}

if (($globlogs{CUSTOM1_LOG}{$lgfile}) and ($line =~ /.*limiting connections by zone .*, client: (\S+),(.*)/)) {
    return ("NGINX Security rule triggered from",$1,"nginx_conn_limit_localhost","6","80,443,8080,8083,8443","86400","0");
}

        return 0;
}

1;
