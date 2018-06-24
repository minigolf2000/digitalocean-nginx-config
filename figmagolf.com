
# Default server configuration
#
server {

  server_name www.figmagolf.com;

  location / {
    proxy_pass http://127.0.0.1:4001;
  }

    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/figmagolf.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/figmagolf.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    server_name  figmagolf.com;
    return       301 http://www.figmagolf.com$request_uri;

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/figmagolf.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/figmagolf.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}



server {
    if ($host = figmagolf.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


    listen       80;
    server_name  figmagolf.com;
    return 404; # managed by Certbot


}
server {
    if ($host = www.figmagolf.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


  listen 80;
  listen [::]:80;

  server_name www.figmagolf.com;
    return 404; # managed by Certbot


}
