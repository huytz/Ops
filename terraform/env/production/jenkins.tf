data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_vpc" "cicd_vpc" {
  cidr_block = "172.17.0.0/16"

  tags = {
    Name = "tf-cicd"
  }
}

resource "aws_subnet" "jenkins_subnet" {
  vpc_id            = aws_vpc.cicd_vpc.id
  cidr_block        = "172.17.10.0/24"
  availability_zone = "ap-southeast-1a"

  tags = {
    Name = "tf-cicd"
  }
}

resource "aws_network_interface" "jenkins" {
  subnet_id   = aws_subnet.jenkins_subnet.id
  private_ips = ["172.17.10.100"]

  tags = {
    Name = "primary_network_interface"
    Instance = "jenkins"
  }
}

resource "aws_instance" "pro_cicd_jenkins_01" {
  ami           = data.aws_ami.ubuntu.id  
  instance_type = "t3.medium"

  network_interface {
    network_interface_id = aws_network_interface.jenkins.id
    device_index         = 0
  }
  tags = {
    Instance = "jenkins"
  }
}