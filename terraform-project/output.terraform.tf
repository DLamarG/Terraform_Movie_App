
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

output "target_group_arn" {
  value = aws_lb_target_group.lamar-TG.arn
}

output "target_group_arn_suffix" {
  value = aws_lb_target_group.lamar-TG.arn_suffix
}

output "launch_template_name" {
  description = "The name of the launch template"
  value       = aws_launch_template.autoscaling_template.name
}

output "launch_template_id" {
  description = "The ID of the launch template"
  value       = aws_launch_template.autoscaling_template.id
}



# Output the Auto Scaling Group ID
output "autoscaling_group_id" {
  value = aws_autoscaling_group.lamar_asg.id
}

# Output the Scale-Out Policy ARN
output "scale_out_policy_arn" {
  value = aws_autoscaling_policy.scale_out_policy.arn
}

# Output the Scale-In Policy ARN (optional, if needed)
output "scale_in_policy_arn" {
  value = aws_autoscaling_policy.scale_in_policy.arn
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