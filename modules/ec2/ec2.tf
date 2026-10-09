# ---------- Inputs ----------
variable "environment" {
  type = string
}

variable "instance_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "instance_count" {
  type = number
}

variable "root_volume_size" {
  type = number
}

variable "key_name" {
  type = string
}

variable "tags" {
  type = map(string)
}

# ---------- Data ----------
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023*-x86_64"]
  }
}

# ---------- Resources ----------
resource "aws_instance" "this" {
  count         = var.instance_count
  ami           = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  key_name      = var.key_name

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = "gp3"
    encrypted   = true
  }

  tags = merge(var.tags, {
    Name        = "${var.environment}-${var.instance_name}-${count.index + 1}"
    Environment = var.environment
  })
}

# ---------- Outputs ----------
output "instance_ids" {
  value = aws_instance.this[*].id
}

output "private_ips" {
  value = aws_instance.this[*].private_ip
}
