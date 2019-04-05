resource "aws_route_table" "ProjectOmega" {
  vpc_id = "${aws_vpc.ProjectOmega.id}"

  tags = {
    Name = "ProjectOmega"
  }
}

resource "aws_route_table" "ProjectOmega-Private" {
  vpc_id = "${aws_vpc.ProjectOmega.id}"

  tags = {
    Name = "ProjectOmega-Private"
  }
}


resource "aws_main_route_table_association" "ProjectOmega" {
  vpc_id         = "${aws_vpc.ProjectOmega.id}"
  route_table_id = "${aws_route_table.ProjectOmega.id}"
}

#adding route rule
resource "aws_route" "ProjectOmega" {
  route_table_id  = "${aws_route_table.ProjectOmega.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  gateway_id = "${aws_internet_gateway.ProjectOmega.id}"
}

resource "aws_route" "ProjectOmega-Private" {
  route_table_id  = "${aws_route_table.ProjectOmega-Private.id}"
  destination_cidr_block = "${var.destinationCIDRblock}"
  nat_gateway_id = "${aws_nat_gateway.ProjectOmega.id}"
}

#adding subnet to route table
resource "aws_route_table_association" "ProjectOmega-Public1" {
    subnet_id      = "${aws_subnet.Public1.id}"
    route_table_id = "${aws_route_table.ProjectOmega.id}"
}
resource "aws_route_table_association" "ProjectOmega-Public2" {
    subnet_id      = "${aws_subnet.Public2.id}"
    route_table_id = "${aws_route_table.ProjectOmega.id}"
}
resource "aws_route_table_association" "ProjectOmega-Private1" {
    subnet_id      = "${aws_subnet.Private1.id}"
    route_table_id = "${aws_route_table.ProjectOmega-Private.id}"
}

resource "aws_route_table_association" "ProjectOmega-Private2" {
    subnet_id      = "${aws_subnet.Private2.id}"
    route_table_id = "${aws_route_table.ProjectOmega-Private.id}"
}

