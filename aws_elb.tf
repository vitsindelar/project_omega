 resource "aws_elb" "ProjectOmega" {
   name               = "ProjectOmega"
#   availability_zones = ["eu-central-1a", "eu-central-2b"]

#  access_logs {
#    bucket        = "foo"
#    bucket_prefix = "bar"
#    interval      = 60
#  }

   listener {
     instance_port     = 80
     instance_protocol = "http"
     lb_port           = 80
     lb_protocol       = "http"
   }

#  listener {
#    instance_port      = 443
#    instance_protocol  = "http"
#    lb_port            = 443
#    lb_protocol        = "https"
#    ssl_certificate_id = "${aws_kms_key.ProjectOmega.arn}"
#  }

   health_check {
     healthy_threshold   = 2
     unhealthy_threshold = 2
     timeout             = 3
     target              = "HTTP:80/"
     interval            = 30
   }

   subnets                  = [ "${aws_subnet.Public1.id}", "${aws_subnet.Public2.id}"]
   security_groups = [ "${aws_security_group.ProjectOmega-Public.id}" ]
   instances =  [ "${aws_instance.Omega-Public-1.id}", "${aws_instance.Omega-Public-2.id}" ]
   cross_zone_load_balancing   = true
   idle_timeout                = 400
   connection_draining         = true
   connection_draining_timeout = 400

   tags = {
     Name = "ProjectOmega"
   }
 }