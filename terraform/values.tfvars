region             = "us-east-2"
lBsecurityGroups   = ["sg-05f2c659771234e07"]
lBSubnet           = ["subnet-f000fe8d", "subnet-1253d379"]
vpcId              = "vpc-1bb52d70"
ecsClusterName     = "config-service-cluster"
tags               = { "Purpose" : "Gokloud-Website" }
ecs_securityGroups = ["sg-05f2c659771234e07"]
ecs_subnets        = ["subnet-0c62dde21482e62dc"]
name_ecs_service   = "config_service"
taskDesiredCount   = 1
cpu                = 256
memory             = 512
roleARN            = "arn:aws:iam::016505711272:role/ecsTaskExecutionRole"
container_name     = "config_service_container"
containerPort      = 80
tgARN              = module.Load_Balancer.tgARN






