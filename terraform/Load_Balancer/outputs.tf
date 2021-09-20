output "tgARN" {
   value = aws_lb_target_group.target_group.arn
 }

output "alb_DNS"{
   value = data.aws_lb.data_lb.dns_name
}
