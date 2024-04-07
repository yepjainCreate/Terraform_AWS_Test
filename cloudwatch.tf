
resource "aws_cloudwatch_metric_alarm" "web_app_alarm" {
  alarm_name          = "web-app-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "HealthyHostCount"
  namespace           = "AWS/ApplicationELB"
  period              = "300"  # 5-minute period
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = "Alarm when there are not enough healthy hosts"
  alarm_actions       = [aws_sns_topic.notification_topic.arn]
}

resource "aws_sns_topic" "notification_topic" {
  name = "web-app-notification-topic"
}

resource "aws_cloudwatch_log_group" "web_app_logs" {
  name              = "/var/log/web-app"
  retention_in_days = 30  # 30 days retention period
}

resource "aws_cloudwatch_log_stream" "web_app_log_stream" {
  name           = "web-app-log-stream"
  log_group_name = aws_cloudwatch_log_group.web_app_logs.name
  depends_on = [ aws_cloudwatch_log_group.web_app_logs ]
}

output "lb_dns_name" {
  value = aws_lb.web_lb.dns_name
}