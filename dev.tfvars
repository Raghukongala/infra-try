region           = "ap-south-1"
environment      = "dev"
instance_name    = "app"
instance_type    = "t3.micro"
instance_count   = 1
root_volume_size = 8
key_name         = null

tags = {
  Project = "modules-new"
  Owner   = "devops"
}
