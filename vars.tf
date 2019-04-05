variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
	default = "eu-central-1"
}
variable "AMIS" {
	type = "map"
	default = {
		eu-central-1 = "ami-0dfd7cad24d571c54"
		eu-west-1 = "ami-0aebeb281fdee5054"
	}
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "mykey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "mykey.pub"
}
variable "INSTANCE_USERNAME" {
  default = "ubuntu"
}
variable "VPC_NAME" {
  default = "ProjectOmega"
}
variable "destinationCIDRblock" {
  default = "0.0.0.0/0"
}
variable "ingressCIDRblock" {
  default = "0.0.0.0/0" 
}
variable "mapPublicIP" {
        default = true
}