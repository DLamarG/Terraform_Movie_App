

# Auto Scaling Group
resource "aws_autoscaling_group" "lamar_asg" {
  desired_capacity   = 1
  max_size           = 3
  min_size           = 1
  vpc_zone_identifier = [aws_subnet.public1.id, aws_subnet.public2.id]

  # Use the provided launch template ID
  launch_template {
    id      = aws_launch_template.autoscaling_template.id
    version = "$Latest"
  }

  tag {
    key                 = "lamar-movie-app"
    value               = "lamar-movie-app"
    propagate_at_launch = true
  }

  # Attach Target Group
  target_group_arns = [aws_lb_target_group.lamar-TG.arn]

  lifecycle {
    create_before_destroy = true
  }
}



# CloudWatch Metric Alarm for Scaling Out
resource "aws_cloudwatch_metric_alarm" "scale_out_alarm" {
  alarm_name          = "High-CPU-Usage-Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 65  # CPU utilization threshold (percentage)
  alarm_description   = "Triggers when CPU usage is 65% or higher"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.lamar_asg.name
  }
  alarm_actions = [aws_autoscaling_policy.scale_out_policy.arn]
}

# Auto Scaling Policy to Scale Out
resource "aws_autoscaling_policy" "scale_out_policy" {
  name                   = "scale-out-policy"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.lamar_asg.name
}

# Auto Scaling Policy to Scale In (Optional)
resource "aws_autoscaling_policy" "scale_in_policy" {
  name                   = "scale-in-policy"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300
  autoscaling_group_name = aws_autoscaling_group.lamar_asg.name
}

