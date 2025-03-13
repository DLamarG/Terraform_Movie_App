

# Load Balancer
resource "aws_lb" "lamar_alb" {
  name               = "lamar-alb"
  internal           = false  # This LB is external
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lamar_test_sg.id]
  subnets            = [aws_subnet.public1.id, aws_subnet.public2.id]  # Provide the list of public subnet IDs

  tags = {
    Name = "Lamars-ALB"
  }
}

# Listener for the Load Balancer
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.lamar_alb.arn
  port              = 8080
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lamar-TG.arn  # Attach the target group created earlier
  }
}

# Output the Load Balancer DNS Name
output "alb_dns_name" {
  value = aws_lb.lamar_alb.dns_name
}

# Output the target group ARN suffix for reference
output "lb_arn_suffix" {
  value = aws_lb.lamar_alb.arn_suffix
}