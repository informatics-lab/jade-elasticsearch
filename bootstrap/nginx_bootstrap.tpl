#cloud-config
 runcmd:
    - 'apt-get update -y'
    - 'apt-get install -y nginx unzip'
    - 'wget -O /home/ubuntu/consul-template.zip https://releases.hashicorp.com/consul-template/0.16.0/consul-template_0.16.0_linux_amd64.zip'
    - 'unzip /home/ubuntu/consul-template.zip -d /usr/local/bin'
    - 'rm /etc/nginx/sites-enabled/default'
    - 'touch /etc/nginx/sites-available/elasticsearch'
    - 'echo "${nginx-config}" > /tmp/elasticsearch.cmptl'
    - 'sed -i "s/HTTP_HOST/\$http_host/g" /tmp/elasticsearch.cmptl'
    - 'sed -i "s/REMOTE_ADDR/\$remote_addr/g" /tmp/elasticsearch.cmptl'
    - 'ln -s /etc/nginx/sites-available/elasticsearch /etc/nginx/sites-enabled/elasticsearch'
    - 'consul-template -consul ${consul_ip}:8500 -template="/tmp/elasticsearch.cmptl:/etc/nginx/sites-available/elasticsearch:service nginx restart"&'
