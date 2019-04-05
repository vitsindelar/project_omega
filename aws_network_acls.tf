resource "aws_network_acl" "ProjectOmega" {
  vpc_id = "${aws_vpc.ProjectOmega.id}"
  subnet_ids = [ "${aws_subnet.Public1.id}", "${aws_subnet.Public2.id}", "${aws_subnet.Private1.id}", "${aws_subnet.Private2.id}" ]

  egress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.destinationCIDRblock}"
    from_port  = 0
    to_port    = 0
  }

# egress {
#   protocol   = "udp"
#   rule_no    = 201
#   action     = "allow"
#   cidr_block = "${var.destinationCIDRblock}"
#   from_port  = 0
#   to_port    = 65535
# }

  ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = "${var.ingressCIDRblock}"
    from_port  = 80
    to_port    = 80
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "${var.ingressCIDRblock}"
    from_port  = 22
    to_port    = 22
  }

 ingress {
   protocol   = "tcp"
   rule_no    = 102
   action     = "allow"
   cidr_block = "${var.ingressCIDRblock}"
   from_port  = 1024
   to_port    = 65535
 }

# ingress {
#   protocol   = "tcp"
#   rule_no    = 103
#   action     = "allow"
#   cidr_block = "${var.ingressCIDRblock}"
#   from_port  = 80
#   to_port    = 80
# }

# ingress {
#   protocol   = "tcp"
#   rule_no    = 104
#   action     = "allow"
#   cidr_block = "${var.ingressCIDRblock}"
#   from_port  = 22
#   to_port    = 22
# }

# ingress {
#   protocol   = "tcp"
#   rule_no    = 105
#   action     = "allow"
#   cidr_block = "${var.ingressCIDRblock}"
#   from_port  = 1024
#   to_port    = 65535
# }

# ingress {
#   protocol   = "tcp"
#   rule_no    = 106
#   action     = "allow"
#   cidr_block = "${var.ingressCIDRblock}"
#   from_port  = 22
#   to_port    = 22
# }

#   ingress {
#   protocol   = "tcp"
#   rule_no    = 107
#   action     = "allow"
#   cidr_block = "${var.ingressCIDRblock}"
#   from_port  = 22
#   to_port    = 22
# }

  tags = {
    Name = "ProjectOmega"
  }
}