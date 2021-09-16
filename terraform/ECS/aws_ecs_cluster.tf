resource "aws_ecs_cluster" "cluster" {
  name = "${var.ecsClusterName}"

#   setting {
#     name  = "containerInsights"
#     value = "enabled"
#   }
}
