
# Default server configuration
#
server {
  server_name www.figmagolf.com;

  location / {
    proxy_pass http://127.0.0.1:4001;
  }
}

server {
  server_name  figmagolf.com;
  return       301 http://www.figmagolf.com$request_uri;
}
