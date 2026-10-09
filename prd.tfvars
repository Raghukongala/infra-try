region           = "ap-south-1"
environment      = "prd"
instance_name    = "app"
instance_type    = "t3.medium"
instance_count   = 3
root_volume_size = 50
key_name         = null

tags = {
  Project = "modules-new"
  Owner   = "devops"
}
