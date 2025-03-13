
# outputs.tf

output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_1" {
  value = aws_subnet.public1.id
}

output "public_subnet_2" {
  value = aws_subnet.public2.id
}

output "security_group_id" {
  value = aws_security_group.lamar_test_sg.id
}

output "instance_public_ip" {
  value = aws_instance.movie_app_instance.public_ip
}

output "instance_id" {
  value = aws_instance.movie_app_instance.id
}





# # Output EC2 instance public IP
# output "public_ip" {
#   value = aws_instance.twoge_instance.public_ip
# }

# output "instance_id" {
#   value = aws_instance.twoge_instance.id
# }



# #Output Security Group
# output "security_group_id" {
#   value = aws_security_group.lamar-test-sg.id
# }

# output "security_group_name" {
#   value = aws_security_group.lamar-test-sg.name
#   description = "Name of the security group"
# }



# #Output VPC
# output "vpc_id" {
#   value = aws_vpc.main.id
# }

# output "public_subnet_1" {
#   value = aws_subnet.public1.id
# }

# output "public_subnet_2" {
#   value = aws_subnet.public2.id
# }