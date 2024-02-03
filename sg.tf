# Security Group for LB
resource "aws_security_group" "lb_sg" {
  name        = "lb-security-group"
  description = "Security group for Elastic Load Balancer"
  vpc_id      = module.vpc.vpc_id
  
  # Inbound rule to allow HTTP traffic from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  # Inbound rule to allow HTTPS traffic from anywhere
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Security Group for ECS tasks
resource "aws_security_group" "ecs_task_sg" {
  name        = "ecs-task-security-group"
  description = "Security group for ECS tasks"
  vpc_id      = module.vpc.vpc_id
}

  # Inbound rule to allow traffic from LB
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    security_groups    = [aws_security_group.lb_sg.id]
  }

  # Outbound rule allowing all traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
