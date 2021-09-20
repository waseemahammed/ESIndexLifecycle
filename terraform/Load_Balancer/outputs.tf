output "tgARN" {
   value = aws_lb_target_group.target_group.arn
 }
output "lb_address" {
   value = aws_lb.web.public_dns
}
