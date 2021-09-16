variable "taskDesiredCount" {
  description = "Number of Task desired to run"
}
variable "securityGroups" {
  type = list(string)
  description = "List of Security Groups to be used"
}
variable "subnets" {
  type = list(string)
  description = "List of Subnets to be used"
}
variable "name_ecs_service"{
  description= "name of service"
}
variable "container_name"{
  description= "name of container"
}
variable "vpcId" {
     description = "vpc id "
}
variable "ecsClusterName"{
 description = "Name of ECS cluster that is created"  
}
variable "imageURI" {
  description = "URI of image for execution"
}
variable "cpu" {
  description = "Amount of CPU to be given to one Task"
}
variable "memory" {
  description = "Amount of memory to be given to one Task"
}
variable "roleARN" {
  description = "Role that the task will assume"
}
variable "containerPort" {
  description = "Port on which your application would be running"
}
variable "tgARN" {
  description = "target group"
}
