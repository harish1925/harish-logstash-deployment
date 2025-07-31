output "instance_id" {
  value = aws_instance.ec2_instance.id
}
output "security_group_id" {
  value = aws_security_group.instance_sg.id
}
output "public_ip" {
  value = aws_instance.ec2_instance.public_ip
}
output "private_ip" {
  value = aws_instance.ec2_instance.private_ip
}
