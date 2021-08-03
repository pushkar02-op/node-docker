provider "aws" {
  
  region = "ap-south-1"
  profile = "pushkar"
}

variable "mykey" {
	type = string
	default = "Key_Pair_1"
}

resource "aws_instance" "prod_inst" {
  ami           = "ami-04db49c0fb2215364"
  instance_type = "t2.micro"
  key_name      = var.mykey
  security_groups = [ "security_group1" ]

   connection {
    type     = "ssh"
    host     = aws_instance.prod_inst.public_ip
    user     = "ec2-user"
    private_key = file    ("C:/Users/pushk/Downloads/Key_Pair_1.pem")
    port    = 22
  }

  
  provisioner "remote-exec" {
    inline = [
      "sudo yum install docker -y",
      "sudo service docker start",
      "sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-`uname -s`-`uname -m` | sudo tee /usr/local/bin/docker-compose > /dev/null",
      "sudo chmod +x /usr/local/bin/docker-compose",
      "sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose",
      "mkdir app",
      "cd app",
      "sudo yum install git -y",
      "sudo git clone https://github.com/pushkar02-op/node-docker .",
      "sudo docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d"
    ]
  }

  tags = {
    Name = "production"
  }
}

output "inst_ip" {
	value = aws_instance.prod_inst.public_ip
}

resource "null_resource" "nullremote1"  {

depends_on = [
    aws_instance.prod_inst,
  ]

provisioner "local-exec" {
	    command = "start chrome  ${aws_instance.prod_inst.public_ip}/api/v1/"
  	}
}