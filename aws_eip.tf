resource "aws_eip" "ProjectOmega" {
#  instance = "${aws_instance.Omega-Private-1.id}"
#  vpc      = "true"
# depends_on = "${aws_internet_gateway.ProjectOmega.id}"
}

#resource "aws_eip" "ProjectOmega-NAT" {
#  instance = "${aws_instance.web.id}"
#  vpc      = true
#}