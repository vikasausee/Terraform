
 
data "template_file" "user_data" {
  template = "${file("UserData.tpl")}"
  
}


resource "aws_instance" "example" {

  ami= "ami-0d740b96c9b6cc5a7"     //// free tier windows AMI
  //ami= "ami-0c91f97cadcc8499e"   // free tier linus AMI
  instance_type = "t2.micro"
  key_name = "GOYAL"
  security_groups = ["${aws_security_group.allow_rdp.name}"]
  user_data       = data.template_file.user_data.rendered
  
}

 

output "ip" {
  value = "${aws_instance.example.*.public_ip}"
}






