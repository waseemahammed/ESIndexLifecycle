output "tgARN" {
   value = aws_lb_target_group.target_group.arn
 }

output "lb_dns_name"{
   value = module.Load_Balancer.lb_dns_name
}
