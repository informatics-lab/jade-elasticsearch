# jade-elasticsearch

This is a pretty brittle first pass at setting up our elasticsearch cluster using Terraform. 

Because the created consul server is not accessible through Terraform you need to do some setup after creating the cluster:

~~~~
import requests

nginx_url = 'http://elasticsearch.informaticslab.co.uk/'
elasticsearch_url = 'http://...'
consul_url = 'http://...:8500'

requests.put('{}/v1/kv/elasticsearch/dns'.format(consul_url), data=elasticsearch_url)
requests.get(nginx_url).json()
~~~~
