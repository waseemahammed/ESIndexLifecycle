
resource "aws_ecs_task_definition" "task_definition" {
  family ="${var.ecsClusterName}Task"               
  network_mode="awsvpc"
  execution_role_arn= "${var.roleARN}"
  requires_compatibilities = ["FARGATE"]
  cpu                      = "${var.cpu}"
  memory                   = "${var.memory}"
  container_definitions = jsonencode([
    {
      name      = "${var.container_name}"
      image     = "${var.imageURI}"
      cpu       = "${var.cpu}"
      memory    = "${var.memory}"
      essential = true
      portMappings = [
        {
          containerPort = "${var.containerPort}"
          protocol      = "tcp"
        }
      ]
    }
  ])
}

#   volume {
#     name      = "service-storage"
#     host_path = "/ecs/service-storage"
#   }

#   placement_constraints {
#     type       = "memberOf"
#     expression = "attribute:ecs.availability-zone in [us-west-2a, us-west-2b]"
#   }

