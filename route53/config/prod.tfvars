identifier = "getrev"
region     = "us-east-1"

######## Domanain configuration ########
domain_name = "newprod.getrev.ai"
non_alias_records = [
  {
    name    = "example"
    records = ["google.com"]
    type    = "CNAME"
    ttl     = 300
  }
]

alias_records = [

]
