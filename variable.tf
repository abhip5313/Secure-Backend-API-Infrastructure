variable "access_key" {
  default = "your access key"
  sensitive = true
}

variable "secret_key" {
  default = "your secret key"
  sensitive = true
}

variable "cidr-vpc" {
  default = "10.0.0.0/16"
}

variable "db-instance-type" {
  default = "db.t3.micro"
}

variable "db-username" {
  default = "admin"
}

variable "db-password" {
  default = "Abhishek3064"
}

variable "db-name" {
  default = "private-db"
}

variable "ami-id" {
  default = "ami-068c0051b15cdb816"
}

variable "instance-type" {
  default = "t2.micro"
}

variable "public-key" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDws3BgaxpPRvkSnzlmyjqn9LfJXvoLzriTvoVkb9EvZcmbzcq4CXNAA9aWtwGGOCuJFBIuhM8plVsWlRa73OmSBBkeb5XsCrLpkizZ826N4/1BDShs467ZIm2Gs9+LacdxrZJuAlylSCuNkzIph/8WSRpzF/nk7iQ/fFWCsmfTbodZdJleaWOPC8jbxOscAEeJ0HeNG/U1Hkvr4UeJeJHE2S5nDatZ3g7YpC9OPIVshzjxLWSLUjnb7/LJC7jQz6wSjb0ROGFU4jivmNpGF1veHfjdw+DU1BMgxIJxmLM0m7cGQyxOrVZzSsQEI4PX2EbgaEb2m+EkVVOmQJWMqEJP9pFx3Ifhm/ao1/rMWyASqX/VkGkuN5Kn1nClc3hFd+4JRzly9vixeW0DrJhEm3mkgnflwEohjIKDUTP5alBrhvpqztdHl13082L9b1Fln+XY69OEDFzBaHTx/6WExBY6A2n7SU7GW6lWCN8ANVBebokRC+L38job//FplysmHes= abhi9@Abhishek"
}