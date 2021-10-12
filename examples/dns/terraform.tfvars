# Set TF_VAR_dns_key_secret environment variable to the secret key for authentication
dns_domain = "resldap.net"
#dns_server         = "bp-idns-p001.gxsonline.net"
dns_server        = "lit-idns-p001.gxsonline.net"
dns_key_name      = "bksvc."
dns_key_algorithm = "hmac-sha256"
hostname          = "lit-vcncka1-b01"
#ip		  = "10.114.227.211"
ip = ["10.136.211.104", "10.136.211.105"]
