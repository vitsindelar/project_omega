resource "aws_internet_gateway" "ProjectOmega" {
  vpc_id     = "${aws_vpc.ProjectOmega.id}"
  tags = {
    Name = "ProjectOmega"
  }
}