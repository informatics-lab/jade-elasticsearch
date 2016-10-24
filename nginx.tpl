server {
        listen 80;
        location / {
            proxy_set_header   X-Forwarded-For REMOTE_ADDR;
            proxy_set_header   Host HTTP_HOST;
            proxy_pass         {{key_or_default \"elasticsearch/dns\" \"http://localhost\"}}; 
        }
    }
