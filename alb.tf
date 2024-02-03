# Define ALB
resource "aws_lb" "my_alb" {
  name                        = "my-alb"
  internal                    = false
  load_balancer_type          = "application"
  security_groups             = [aws_security_group.alb_sg.id]
  subnets                     = [aws_subnet.my_subnet.id]
  enable_deletion_protection  = false
}

# Define ALB listeners
resource "aws_lb_listener" "http_listener" {
  load_balancer_arn = aws_lb.my_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.my_target_group.arn
  }
}

# Define the ALB target group
resource "aws_lb_target_group" "my_target_group" {
  name                = "my-target-group"
  port                = 80
  protocol            = "HTTP"
  vpc_id              = aws_vpc.my_vpc.id
  target_type         = "ip"
  
  health_check {
    path                = "/"
    protocol            = "HTTP"
    timeout             = 5
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2 
    matcher             = "200"
  }
}
