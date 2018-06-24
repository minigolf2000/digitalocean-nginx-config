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
}

server {
  server_name  golfsinteppadon.com;
  return       301 http://www.golfsinteppadon.com$request_uri;
}
