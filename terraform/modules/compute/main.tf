resource "aws_security_group" "instance_sg" {
  name        = "${var.name}-sg"
  description = "Security group for ${var.name}"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = lookup(ingress.value, "source", null) != null ? [ingress.value.source] : []
      security_groups = lookup(ingress.value, "source_sg", null) != null ? [ingress.value.source_sg] : []
    }
  }
  dynamic "egress" {
    for_each = var.egress_rules
    content {
      from_port   = egress.value.from_port
      to_port     = egress.value.to_port
      protocol    = egress.value.protocol
      cidr_blocks = [egress.value.cidr_block]
    }
  }
  tags = {
    Name = "${var.name}-sg"
  }
}
resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [aws_security_group.instance_sg.id]
   tags = merge(
    {
      Name = var.name
    },
    var.tags
  )
}
