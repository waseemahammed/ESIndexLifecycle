resource "aws_ecs_service" "service" {
  name            = "${var.name_ecs_service}"
  cluster         = aws_ecs_cluster.cluster.id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.task_definition.id
  desired_count   = "${var.taskDesiredCount}"
  deployment_circuit_breaker {
       enable=true
       rollback=true
    }
 

 network_configuration {
    assign_public_ip = false
    security_groups  = "${var.securityGroups}"
    subnets          = "${var.subnets}"
  }


  load_balancer {
    target_group_arn =  var.tgARN
    container_name   = "${var.container_name}"
    container_port   = "${var.containerPort}"
  }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
#   }

#   ordered_placement_strategy {
#     type  = "binpack"
#     field = "cpu"
#   }
}
