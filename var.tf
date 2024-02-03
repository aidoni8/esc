variable "aws_region" {
  description = "Add AWS region."
  default     = "us-east-2"
  type        = string
}


variable "ecs_iam_role_name" {
  type        = string
  description = "Enter a name for the ECS IAM Role"
  default     = "ecsTaskExecutionRole"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "Enter a name for ECS cluster"
  default     = "demo-ecs-cluster"
}

variable "aws_ecr_repository" {
  type        = string
  description = "ECR repo name"
  default     = "demo_ecs_app"
}

variable "aws_ecs_task_def_fam" {
  type        = string
  description = "demo_ecs_fam"
  default     = "demo_ecs_fam"
}

variable "fargate_cpu" {
  type        = number
  description = "enter required number of cpus"
  default     = 1024
}

variable "fargate_memory" {
  type        = number
  description = "Enter required memory"
  default     = 2048
}

variable "aws_ecs_service_name" {
  type        = string
  description = "service name"
  default     = "demo_ecs_svc"
}

variable "app_port" {
  type        = number
  description = "Port number of the application contianer"
  default     = 80
}

variable "app_count" {
  type        = number
  description = "Number of replicas of the pod"
  default     = 2
}

variable "ecs_alb_name" {
  type        = string
  description = "ALB Name"
  default     = "demo-ecs-alb"
}

variable "health_check_path" {
  type    = string
  default = "/"
}

variable "aws_sg_name" {
  type        = string
  description = "security group name"
  default     = "demo_ecs_sg"
}

variable "tag" {
  type    = string
  default = "demo"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}
