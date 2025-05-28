variable "ami_id" {}
variable "instance_type" {}
variable "subnet_ids" {
  type = list(string)
}
variable "vpc_id" {}
variable "alb_sg" {}
variable "key_name" {
  description = "Nom de la clé SSH EC2 (déjà créée dans AWS)"
  type        = string
}
variable "project_name" {
  description = "Nom du projet API"
  type        = string
  default     = "cloud-api"
}
