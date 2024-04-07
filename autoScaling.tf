resource "aws_launch_configuration" "web_lc" {
  image_id        = var.ami_id
  instance_type   = "t2.micro"  # Change to desired instance type
  security_groups = [aws_security_group.web_sg.id]
 
  # Add block device mapping for root and secondary volumes
  root_block_device {
    volume_size = 20  # Size in GB for root volume
    encrypted   = true  # Encrypt root volume
  }

  ebs_block_device {
    device_name = "/dev/sdb"
    volume_size = 10  # Size in GB for secondary volume
    encrypted   = true  # Encrypt secondary volume
  }

  lifecycle {
    create_before_destroy = true
  }

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y ansible

              # Run Ansible playbook
              ansible-playbook ${var.ansible_playbook_path}
              EOF
    depends_on = [ aws_security_group.web_sg ]
}

resource "aws_autoscaling_group" "web_asg" {
  launch_configuration = aws_launch_configuration.web_lc.name
  vpc_zone_identifier  = [aws_subnet.private.id]
  min_size             = 1
  max_size             = 3  # Change as needed
  desired_capacity     = 2  # Change as needed
 depends_on = [ aws_launch_configuration.web_lc , aws_subnet.private ]
}

resource "aws_autoscaling_policy" "scale_out" {
  name                   = "scale-out"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300  # 5 minutes cooldown period
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  depends_on = [ aws_autoscaling_group.web_asg ]
}

resource "aws_autoscaling_policy" "scale_in" {
  name                   = "scale-in"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 300  # 5 minutes cooldown period
  autoscaling_group_name = aws_autoscaling_group.web_asg.name
  depends_on = [ aws_autoscaling_group.web_asg ]
}