# Create an Application Load Balancer
resource "aws_lb" "app-lb" {
  name               = "web-server-app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.app-lb-sg.id]
  subnets = [for subnet in aws_subnet.subnets: subnet.id]


  tags = {
    Environment = "production"
  }
}

# Create security group to all http and https tcp traffic into load balancer
resource "aws_security_group" "app-lb-sg" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TLS  secured from anywhere"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from anywhere"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# Create target group pointing to instances for
# the ALB to share requests to
resource "aws_lb_target_group" "app-lb-tg" {
  name        = "web-server-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.my_vpc.id
  health_check {
    path = "/"
    port = "80"
    protocol = "HTTP"
    healthy_threshold = 2
    unhealthy_threshold = 2
    timeout = 3
    interval = 300
    matcher = "200"
  }
}

# Attach the instances to the target group
resource "aws_lb_target_group_attachment" "attach_instances" {
  count = length(aws_instance.servers)
  target_group_arn = aws_lb_target_group.app-lb-tg.arn
  target_id        = aws_instance.servers[count.index]["id"]
  port             = 80
}

# Create an HTTP listener for the ALB
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.app-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.app-lb-tg.arn
    type             = "forward"
  }
  depends_on = [
    aws_lb_target_group.app-lb-tg
  ]
}
