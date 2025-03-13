

# Launch Template
resource "aws_launch_template" "autoscaling_template" {
  name_prefix   = "lamar-movie-app-template"
  image_id      = "ami-0d0f28110d16ee7d6"  
  instance_type = "t2.micro"              

  # Specify security group(s)
  vpc_security_group_ids = [aws_security_group.lamar_test_sg.id] # My existing security group

  # Optional: User data for instance initialization
  user_data = base64encode(templatefile("${path.module}/movie_app_bootstrap.sh", {}))

  # Tagging EC2 instances
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "lamar-movie-app-instance"
    }
  }
}
