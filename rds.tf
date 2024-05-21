resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "ziyo"
  engine               = "postgres"
  engine_version       = "12.15"
  instance_class       = "db.t3.micro"
  username             = "ziyo_user"
  password             = aws_ssm_parameter.foo.value
  parameter_group_name = "default.postgres12"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.ziyo_subg.id
  vpc_security_group_ids = [aws_security_group.ziyo_security_group.id]
  storage_type = "gp2"
}

resource "aws_db_subnet_group" "ziyo_subg" {
  name       = "ziyo_sub_group"
  subnet_ids = [aws_subnet.ziyo_subnet_public.id, aws_subnet.ziyo_subnet_private.id]
}

resource "random_password" "password" {
  length           = 10
  special          = false
}

resource "aws_ssm_parameter" "foo" {
  name  = "ziyo_2024_class_rds_pass"
  type  = "String"
  value = random_password.password.result
}
