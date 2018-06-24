server {
  listen 80;
  listen [::]:80;

  root /var/www/sinteppadon.com;
  index index.html;
  server_name www.sinteppadon.com;

  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri/ =404;
  }
}

server {
    listen       80;
    server_name  sinteppadon.com;
    return       301 http://www.sinteppadon.com$request_uri;
}

