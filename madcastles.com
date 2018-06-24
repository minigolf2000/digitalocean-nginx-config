server {
  root /var/www/madcastles.com;
  index index.html;

  server_name www.madcastles.com;

  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri/ =404;
  }
}

server {
  server_name  madcastles.com;
  return       301 http://www.madcastles.com$request_uri;
}
