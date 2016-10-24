#cloud-config
runcmd:
    - 'apt-get update -y'
    - 'apt-get install -y unzip'
    - 'wget https://releases.hashicorp.com/consul/0.7.0/consul_0.7.0_linux_amd64.zip -O /home/ubuntu/consul.zip'
    - 'unzip /home/ubuntu/consul.zip -d /usr/local/bin'
    - "sudo consul agent -data-dir=/tmp/consul -bootstrap -server -client $(ip route get 8.8.8.8 | awk '{print $NF; exit}') &"
