server {

  root /var/www/virtuososheetmusic.com;
  index index.html;

  server_name www.virtuososheetmusic.com;

  location / {
    # First attempt to serve request as file, then
    # as directory, then fall back to displaying a 404.
    try_files $uri $uri/ =404;
  }

}

server {
  server_name  virtuososheetmusic.com;
  return       301 http://www.virtuososheetmusic.com$request_uri;
}
