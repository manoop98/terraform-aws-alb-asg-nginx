############################
# AMI (Dynamic – correct)
############################
data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

############################
# Launch Template
############################
resource "aws_launch_template" "web" {
  name_prefix   = "web-lt-"
  image_id      = data.aws_ami.amazon_linux.id
  instance_type = "t3.micro"
  user_data     = base64encode(file("userdata.sh"))

  network_interfaces {
    security_groups = [aws_security_group.ec2_sg.id]
  }
}



############################
# Auto Scaling Group
############################
resource "aws_autoscaling_group" "asg" {
  name                = "web-asg"
  desired_capacity    = 1
  max_size            = 2
  min_size            = 1

  vpc_zone_identifier = aws_subnet.private[*].id

  launch_template {
    id      = aws_launch_template.web.id
    version = "$Latest"
  }

  target_group_arns = [aws_lb_target_group.tg.arn]

  health_check_type         = "ELB"
  health_check_grace_period = 300
}

