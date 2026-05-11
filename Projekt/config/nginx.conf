events {}

http {
    server {
        listen 80;

        # Suunab kõik päringud Manager.io rakendusele
        location / {
            proxy_pass         http://manager:8080;
            proxy_set_header   Host $host;
            proxy_set_header   X-Real-IP $remote_addr;
        }
    }
}
