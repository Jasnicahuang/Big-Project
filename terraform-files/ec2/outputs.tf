output "instance_public_ip" {
  value       = aws_instance.my_ec2.*.public_ip
  description = "The private IP address of the main server instance."
}

output "instance_name" {
  value       = aws_instance.my_ec2.*.tags.Name
  description = "show tags."
}

output "dns_record_public" {
  value       = aws_instance.my_ec2.*.public_dns
  description = "show dns."
}

output "dns_record_private" {
  value       = aws_instance.my_ec2.*.private_dns
  description = "show dns."
}
