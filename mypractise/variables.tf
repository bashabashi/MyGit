variable "accesskey" {
    type = "string"
}
variable "secretkey" {
    type = "string"  
}
variable "region" {
    default = "us-west-2"  
}
variable "imageid" {
    default = "ami-0bbe6b35405ecebdb"  
}
variable "key" {
    default = "download"  
}
variable "securitygroups" {
    default = ["ALL TCP"]  
}
variable "instancetype" {
    default = "t2.micro" 
}
variable "privatekeypath" {}


