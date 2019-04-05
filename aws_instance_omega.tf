resource "aws_instance" "Omega-Public-1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  vpc_security_group_ids = ["${aws_security_group.ProjectOmega-Public.id}"]
  connection {
        type = "ssh"
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
      }
	provisioner "file" {
    		source = "script.sh"
    		destination = "/tmp/script.sh"
	  }	
 	provisioner "remote-exec" {
   		 inline = [
    		  "chmod +x /tmp/script.sh",
    		  "sudo /tmp/script.sh"
  	 	 ]
 	 }
  subnet_id = "${aws_subnet.Public1.id}"
  key_name = "${module.mykey.key_name}"
  tags {
    Name = "Omega-Public-1"
    }
  }

resource "aws_instance" "Omega-Public-2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1b"
  vpc_security_group_ids = ["${aws_security_group.ProjectOmega-Public.id}"]
  connection {
        type = "ssh"
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
      }
  provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    } 
  provisioner "remote-exec" {
       inline = [
          "chmod +x /tmp/script.sh",
          "sudo /tmp/script.sh"
       ]
   }
  subnet_id = "${aws_subnet.Public2.id}"
  key_name = "${module.mykey.key_name}"
  tags {
    Name = "Omega-Public-2"
  }
  }

resource "aws_instance" "Omega-Private-1" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  vpc_security_group_ids = ["${aws_security_group.ProjectOmega-Private.id}"]
  connection {
        type = "ssh"
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
        bastion_host = "${aws_instance.Omega-Public-1.public_ip}"
        bastion_user = "${var.INSTANCE_USERNAME}"
        bastion_private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
      }
  provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    } 
  provisioner "remote-exec" {
       inline = [
          "chmod +x /tmp/script.sh",
          "sudo /tmp/script.sh"
       ]
   }
  subnet_id = "${aws_subnet.Private1.id}"
  key_name = "${module.mykey.key_name}"
  tags {
    Name = "Omega-Private-1"
  }
  }

resource "aws_instance" "Omega-Private-2" {
  ami           = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1b"
  vpc_security_group_ids = ["${aws_security_group.ProjectOmega-Private.id}"]
  connection {
        type = "ssh"
        user = "${var.INSTANCE_USERNAME}"
        private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
        bastion_host = "${aws_instance.Omega-Public-2.public_ip}"
        bastion_user = "${var.INSTANCE_USERNAME}"
        bastion_private_key = "${file("${var.PATH_TO_PRIVATE_KEY}")}"
      }
  provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    } 
  provisioner "remote-exec" {
       inline = [
          "chmod +x /tmp/script.sh",
          "sudo /tmp/script.sh"
       ]
   }
  subnet_id = "${aws_subnet.Private2.id}"
  key_name = "${module.mykey.key_name}"
  tags {
    Name = "Omega-Private-2"
  }
  }
