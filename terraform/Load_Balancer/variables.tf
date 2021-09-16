variable "lBsecurityGroups"{
    description= "security group for load balancer"
}
variable "lBSubnet" {
  description = "subnet for loab balancer"
}
variable "vpcId" {
     description = "vpc id "
}
variable "ecsClusterName" {
  description = "cluster name for load balancer target"
}