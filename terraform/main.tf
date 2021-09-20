module "Load_Balancer" {
  source = "./terraform/Load_Balancer"
  lBsecurityGroups=["sg-00dabe59749aa1fa2"]
  lBSubnet=["subnet-06ccdf43963cdf2e2","subnet-0ddb8f7753d452e9e"]
  vpcId      = "vpc-0d3925dbda8fa5661"
  ecsClusterName = "config-service-cluster"
 

}
module "ECS" {
  source = "./terraform/ECS"
  
  securityGroups=["sg-00dabe59749aa1fa2"]
  subnets=["subnet-06ccdf43963cdf2e2"]
  vpcId      = "vpc-0d3925dbda8fa5661"
  ecsClusterName = "config-service-cluster"
  name_ecs_service="config_service"
  taskDesiredCount = 1
  imageURI = "630532976899.dkr.ecr.us-east-1.amazonaws.com/gokloudwebsite:first" 
  cpu = 256
  memory = 512
  roleARN = "arn:aws:iam::630532976899:role/ecsTaskExecutionRole"
  container_name="config_service_container" 
  containerPort = 80
  tgARN= module.Load_Balancer.tgARN
}
