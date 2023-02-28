variable "aws_region" {}
variable "vpc_cidr_block" {}
variable "instance_tenancy" {}
variable "name" {}
variable "env" {}
variable "publicsubnet_cidr_block" {}
variable "azs" {}
variable "sg_cidr_blocks" {}
variable "instance_type" {}
variable "key_name" {}
variable "imagename" {}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 8080
}
variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "1024"
}
variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "2048"
}

variable "tag" {
    default     = "42"
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 2
}

variable "ecs_task_execution_role_name" {
  description = "ECS task execution role name"
  default = "myEcsTaskExecutionRole"
}

variable "ecs_auto_scale_role_name" {
  description = "ECS auto scale role Name"
  default = "myEcsAutoScaleRole"
}

variable "health_check_path" {
  default = "/"
}




