
resource "aws_cloudwatch_metric_alarm" "web_app_alarm" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = var.evaluation_periods
  metric_name         = var.metric_name
  namespace           = var.namespace
  period              = var.period
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = var.alarm_description
  alarm_actions       = [aws_sns_topic.notification_topic.arn]
  depends_on = [ aws_sns_topic.notification_topic ]
}

resource "aws_sns_topic" "notification_topic" {
  name = var.sns_topic
}

resource "aws_cloudwatch_log_group" "web_app_logs" {
  name              = var.cloudwatch_log_group_name
  retention_in_days = 30  # 30 days retention period
}

resource "aws_cloudwatch_log_stream" "web_app_log_stream" {
  name           = var.cloudwatch_log_stream_name
  log_group_name = aws_cloudwatch_log_group.web_app_logs.name
  depends_on = [ aws_cloudwatch_log_group.web_app_logs ]
}