variable "region" {
  type    = string
  default = "us-east-2"
}

variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
  default     = "my-ecs-cluster"
}

variable "task_family" {
  description = "Family name of the ECS task definition"
  type        = string
  default     = "myapp-task"
}

variable "container_image" {
  description = "Docker image for the container"
  type        = string
  default     = "aidoni8/dockernew:latest"
}

variable "container_cpu" {
  description = "CPU units for the container"
  type        = number
  default     = "256"
}

variable "container_memory" {
  description = "Memory for the container"
  type        = number
  default     = "512"
}

variable "ecs_task_execution_role_name" {
  type    = string
  default = "ecsTaskExecutionRole"
}
