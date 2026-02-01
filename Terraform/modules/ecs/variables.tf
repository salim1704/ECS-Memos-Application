variable "aws_ecs_cluster_name" {
  description = "ECS cluster name"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "container_image" {
  description = "ECR image URI"
  type        = string
}

variable "container_port" {
  description = "Container port"
  type        = number
  default     = 8081
}

variable "task_cpu" {
  description = "Task CPU"
  type        = string
  default     = "256"
}

variable "task_memory" {
  description = "Task memory"
  type        = string
  default     = "512"
}

variable "app_count" {
  description = "Number of tasks"
  type        = number
  default     = 1
}

variable "ecs_task_execution_role_arn" {
  description = "Task execution role ARN"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "private_subnet_ids" {
  description = "Private subnet IDs"
  type        = list(string)
}

variable "ecs_sg_id" {
  description = "ECS security group ID"
  type        = string
}

variable "alb_target_group_arn" {
  description = "ALB target group ARN"
  type        = string
}

variable "alb_listener_https_arn" {
  description = "ALB HTTPS listener ARN"
  type        = string
}