variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}

variable "aws_ecs_cluster_name" {
  type        = string
  description = "Enter a name for ECS cluster"
  default     = "demo-ecs-cluster"
}
