

# Target Group
resource "aws_lb_target_group" "lamar-TG" {
  name        = "Lamar-Movie-App-TG"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id  # Provide your VPC ID
  target_type = "instance"  # target type (instance)

  health_check {
    path                = "/"
    interval            = 300
    timeout             = 5
    healthy_threshold   = 3
    unhealthy_threshold = 3
  }

  tags = {
    Name = "Lamar-Movie-App-TG"
  }
}

# Register EC2 instance with target group
resource "aws_lb_target_group_attachment" "connect_ec2" {
  target_group_arn = aws_lb_target_group.lamar-TG.arn
  target_id        = aws_instance.movie_app_instance.id
  port             = 8080  # The port on which your EC2 instance listens
}

