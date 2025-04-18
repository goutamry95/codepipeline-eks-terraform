resource "aws_instance" "jump_host" {
  ami           = "ami-0c2b8ca1dad447f8a" # Amazon Linux 2 AMI (make sure it's valid for your region)
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnets[0] # You can change to [1] if you want the second subnet

  vpc_security_group_ids = [
    module.eks.node_security_group_id
  ]

  key_name = var.key_pair_name # Ensure this key pair exists in your AWS account

  tags = {
    Name = "jump-host"
  }

  associate_public_ip_address = true
}
