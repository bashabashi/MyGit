provider "aws" {
    access_key = "${var.accesskey}"
    secret_key = "${var.secretkey}"
    region     = "${var.region}"
}

resource "aws_instance" "mypractise" {
    ami = "${var.imageid}"
    instance_type = "${var.instancetype}"
    key_name = "${var.key}"
    security_groups = "${var.securitygroups}"
    connection {
      user = "ubuntu"
      private_key = "${file(var.privatekeypath)}"
    }
    
    provisioner "remote-exec"{
      inline = [
        "sudo apt-get update",
        "sudo apt-get install tomcat7 -y",
      ]
    }
}

resource "aws_db_instance" "default" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
}
output "PublicIP" {
  value = "${aws_instance.mypractise.public_ip}"
}
output "PrivateIP" {
  value = "${aws_instance.mypractise.private_ip}"
}

