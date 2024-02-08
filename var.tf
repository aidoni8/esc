variable "region" {
  type    = string
  default = "us-east-2"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type    = list(string)
  default = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "public_subnets" {
  type        = list(string)
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  description = "CIDR blocks for public subnets"
}

variable "private_subnets" {
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  description = "CIDR blocks for private subnets"
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
