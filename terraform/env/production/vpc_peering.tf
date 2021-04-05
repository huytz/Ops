resource "aws_vpc_peering_connection" "jenkins_to_eks" {
  peer_vpc_id   = aws_vpc.cicd_vpc.id
  vpc_id        = module.vpc.vpc_id
  auto_accept   = true

  tags = {
    Name = "VPC Peering between jenkins and eks"
  }

  depends_on = [module.vpc.vpc_id]
}