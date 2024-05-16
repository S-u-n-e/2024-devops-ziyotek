resource "aws_instance" "web_server1" {
  ami                         = "ami-07caf09b362be10b8"
  subnet_id                   = aws_subnet.ziyo_subnet_public.id
  vpc_security_group_ids      = [aws_security_group.ziyo_security_group.id]
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.deployer.key_name


  tags = {
    Name = "web_server1"
  }
}  

resource "tls_private_key" "rsa-4096-example" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "deployer" {
  key_name   = "ziyo-2024-delete-me"
  public_key = tls_private_key.rsa-4096-example.public_key_openssh
}

resource "aws_ssm_parameter" "ssh_foo" {
    name = "ziyo_2024_class_ssh"
    type = "String"
    value = tls_private_key.rsa-4096-example.private_key_pem
}