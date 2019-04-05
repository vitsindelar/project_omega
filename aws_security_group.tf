resource "aws_security_group" "ProjectOmega-Public" {
  vpc_id       = "${aws_vpc.ProjectOmega.id}"
  name         = "ProjectOmega-Public"
  description  = "ProjectOmega-Public"
ingress {
    cidr_blocks = [ "${var.ingressCIDRblock}" ]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }
ingress {
    cidr_blocks = [ "${var.ingressCIDRblock}" ]
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
  }
egress {
    cidr_blocks = [ "${var.destinationCIDRblock}" ]
    from_port   = 0
    to_port     = 0
    protocol    = "all"
  }
tags = {
        Name = "ProjectOmega-Public"
  }
}

resource "aws_security_group" "ProjectOmega-Private" {
  vpc_id       = "${aws_vpc.ProjectOmega.id}"
  name         = "ProjectOmega-Private"
  description  = "ProjectOmega-Private"
ingress {
    cidr_blocks = [ "${aws_subnet.Public1.cidr_block}", "${aws_subnet.Public2.cidr_block}" ]
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
}
egress {
    cidr_blocks = [ "${var.destinationCIDRblock}" ]
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
  }
tags = {
        Name = "ProjectOmega-Private"
  }
}