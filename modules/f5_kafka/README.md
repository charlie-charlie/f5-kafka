## Note
Code in this repo is to create F5 resources like nodes, pool, attach nodes to pool, and virtual server. Considering kafka case,  it could have multiple pools like pool for broker, for zookeeper, replicator, schema registry etc. 

Based on practice, in case of Kafka, you may want create multiple virtual servers, like 1 virtual server for kafka broker, 1 virtual server for kafka schema registry etc. In this case, you have to pass into different virtual_server_port and ltm_node_port!


## Required variables
- ```f5_address```: URL of f5 endpoint
- ```f5_username```
- ```f5_password```
- ```virtual_server_destination```: ip address of the virtual server
- ```ltm_nodes```: ip addresses of kafka broker nodes
- ```app_name```: Name of application. in <app>-<cluster#>-<project>-<env> format 