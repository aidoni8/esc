resource "aws_lb" "my_alb" {
  name               = "my-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.lb_sg.id]                          # Associate the ALB with the security group
  subnets            = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"] # Specify your public subnets
}

resource "aws_lb_target_group" "my_target_group" {
  name        = "my-target-group"
  port        = 80              # Port that your ECS tasks or containers are listening on
  protocol    = "HTTP"          # Protocol used by your ECS tasks or containers
  vpc_id      = module.vpc.vpc_id # Specify your VPC ID
  target_type = "ip"
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

resource "aws_lb_listener" "my_listener" {
  load_balancer_arn = aws_lb.my_alb.arn # Specify the ARN of your ALB
  port              = 80                # Port on which the ALB will listen for incoming traffic
  protocol          = "HTTP"            # Protocol used by the ALB

  default_action {
    type             = "forward"                               # Action to take for incoming requests
    target_group_arn = aws_lb_target_group.my_target_group.arn # Specify the ARN of your target group
  }
}
