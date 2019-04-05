resource "aws_subnet"  "Public1" {
  vpc_id     = "${aws_vpc.ProjectOmega.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-central-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Omega-Public1"
  }
}

resource "aws_subnet"  "Public2" {
  vpc_id     = "${aws_vpc.ProjectOmega.id}"
  cidr_block = "10.0.101.0/24"
  availability_zone = "eu-central-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Omega-Public2"
  }
}

resource "aws_subnet"  "Private1" {
  vpc_id     = "${aws_vpc.ProjectOmega.id}"
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-central-1a"
  tags = {
    Name = "Omega-Private1"
  }
}

resource "aws_subnet"  "Private2" {
  vpc_id     = "${aws_vpc.ProjectOmega.id}"
  cidr_block = "10.0.102.0/24"
  availability_zone = "eu-central-1b"
  tags = {
    Name = "Omega-Private2"
  }
}