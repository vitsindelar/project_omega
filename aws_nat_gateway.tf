resource "aws_nat_gateway" "ProjectOmega" {
  
  allocation_id = "${aws_eip.ProjectOmega.id}"
  subnet_id     = "${aws_subnet.Public1.id}"

  tags = {
    Name = "ProjectOmega"
  }
}