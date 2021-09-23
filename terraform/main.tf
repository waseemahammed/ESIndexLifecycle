module "Load_Balancer" {
  source           = "./Load_Balancer"
  lBsecurityGroups = var.lBsecurityGroups
  lBSubnet         = var.lBSubnet
  vpcId            = var.vpcId
  ecsClusterName   = var.ecsClusterName
  tags             = var.tags


}
module "ECS" {
  source           = "./ECS"
  securityGroups   = var.ecs_securityGroups
  subnets          = var.ecs_subnets
  vpcId            = var.vpcId
  ecsClusterName   = var.ecsClusterName
  name_ecs_service = var.name_ecs_service
  taskDesiredCount = var.taskDesiredCount
  imageURI         = var.imageURI
  cpu              = var.cpu
  memory           = var.memory
  roleARN          = var.roleARN
  container_name   = var.container_name
  containerPort    = var.containerPort
  tgARN            = var.tgARN
  tags             = var.tags
}
