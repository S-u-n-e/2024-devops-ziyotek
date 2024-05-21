resource "aws_launch_configuration" "as_conf" {
  name          = "web_tier"
  image_id      = data.aws_ami.example.image.id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [
    aws_security_group.ziyo_security_group.id
  ]
}