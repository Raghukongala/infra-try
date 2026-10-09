region           = "ap-south-1"
environment      = "uat"
instance_name    = "app"
instance_type    = "t3.small"
instance_count   = 2
root_volume_size = 20
key_name         = null

tags = {
  Project = "modules-new"
  Owner   = "devops"
}
