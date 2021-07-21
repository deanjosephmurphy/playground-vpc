module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "playground-vpc"
  cidr = "192.168.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets = ["192.168.1.0/24", "192.168.2.0/24", "192.168.3.0/24"]
  private_subnets  = ["192.168.101.0/24", "192.168.102.0/24", "192.168.103.0/24"]

  enable_nat_gateway = true
  single_nat_gateway  = false
  reuse_nat_ips       = true                    # <= Skip creation of EIPs for the NAT Gateways
  external_nat_ip_ids = "${aws_eip.nat.*.id}"

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}