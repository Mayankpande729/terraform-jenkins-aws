###############S3 BACKEND##########################
resource "aws_s3_bucket" "b" {
  bucket = "dev-terraform-mayank"
  acl    = "private"
  tags = {
    Name        = "Mybucket"
    Environment = var.env
  }
}
###################EC2#############################
resource "aws_instance" "dev_webapp" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  tags = {
    Name = "ec2-${var.env}-webapp"
  }
}
########RDS#####################################
resource "aws_db_instance" "rdsdevdb" {
  #identifier = "rds-mysql-freetier"
  allocated_storage = 5
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  name = "rdsdevdb"
  username = "root"
  password  = "Welcome123"
  parameter_group_name = "default.mysql5.7"
  multi_az = false
  backup_retention_period = 0
  skip_final_snapshot = true
}
