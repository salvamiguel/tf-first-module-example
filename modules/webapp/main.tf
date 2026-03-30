locals {
  common_tags = merge(
    {
      Application = var.app_name
      ManagedBy   = "terraform"
    },
    var.tags
  )
}

resource "aws_security_group" "this" {
  name        = "${var.app_name}-sg"
  description = "Security group para ${var.app_name}"
  vpc_id      = var.vpc_id

  dynamic "ingress" {
    for_each = var.allowed_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.common_tags
}

resource "aws_instance" "this" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.this.id]

  tags = merge(
    local.common_tags,
    { Name = "${var.app_name}-instance" }
  )
}
