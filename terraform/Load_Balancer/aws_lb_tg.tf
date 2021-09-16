resource "aws_lb_target_group" "target_group" {
  name        ="${var.ecsClusterName}-tg"   
  port        =  4000
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = "${var.vpcId}"
}
