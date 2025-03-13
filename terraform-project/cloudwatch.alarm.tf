resource "aws_cloudwatch_metric_alarm" "cpu_usage_alarm" {
  alarm_name          = "HighCPUUsage"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300  # 5 minutes (in seconds)
  statistic           = "Average"
  threshold           = 70  # CPU usage threshold, in percent
  alarm_description   = "Triggers when the EC2 instance's CPU usage is greater than 80% for 5 minutes."
  
  dimensions = {
    InstanceId = aws_instance.movie_app_instance.id  # Make sure to replace this with the actual instance ID
  }

  # Optional: Define actions when the alarm triggers
  alarm_actions = [
    # Example SNS topic ARN to notify when the alarm is triggered
    "arn:aws:sns:us-east-2:536697237321:Lamar_Doge_Topic:d35e927c-deed-4b79-a342-355f9f8e170b"
  ]
}
