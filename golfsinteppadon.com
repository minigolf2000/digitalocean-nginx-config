##
# You should look at the following URL's in order to grasp a solid understanding
# of Nginx configuration files in order to fully unleash the power of Nginx.
# http://wiki.nginx.org/Pitfalls
# http://wiki.nginx.org/QuickStart
# http://wiki.nginx.org/Configuration
#
# Generally, you will want to move this file somewhere, and start with a clean
# file but keep this around for reference. Or just disable in sites-enabled.
#
# Please see /usr/share/doc/nginx-doc/examples/ for more detailed examples.
##

# Default server configuration
#
server {

  root /var/www/golfsinteppadon.com;
  index index.html;
  ssi on;
  server_name www.golfsinteppadon.com;

  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri/ =404;
  }

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/golfsinteppadon.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/golfsinteppadon.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    server_name  golfsinteppadon.com;
    return       301 http://www.golfsinteppadon.com$request_uri;

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/golfsinteppadon.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/golfsinteppadon.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}



server {
    if ($host = golfsinteppadon.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen       80;
    server_name  golfsinteppadon.com;
    return 404; # managed by Certbot


}
server {
    if ($host = www.golfsinteppadon.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


  listen 80;
  listen [::]:80;
  server_name www.golfsinteppadon.com;
    return 404; # managed by Certbot


}
