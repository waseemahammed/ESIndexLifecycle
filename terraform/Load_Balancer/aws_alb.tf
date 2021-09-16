resource "aws_lb" "load_balancer" {
  name               = "${var.ecsClusterName}-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.lBsecurityGroups}"
  subnets            = "${var.lBSubnet}"

  enable_deletion_protection = false
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.load_balancer.arn 
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn    = aws_lb_target_group.target_group.arn
  }
}
