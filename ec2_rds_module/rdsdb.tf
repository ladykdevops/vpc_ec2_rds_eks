# Create AWS RDS Database
module "rds-sqlserver" {
source  = "aws-samples/windows-workloads-on-aws/aws//modules/rds-sqlserver"

  identifier      = locals.name
  engine         = var.rdssql_engine[0]
  engine_version = var.rdssql_engine_version[0]
  license_model  = "license-included"
  port           = 1433

  allow_major_version_upgrade = false
  auto_minor_version_upgrade  = true
  apply_immediately           = true

  timezone           = var.time_zone
  character_set_name = var.sql_collation

  backup_window            = var.backup_windows_retention_maintenance[0]
  backup_retention_period  = var.backup_windows_retention_maintenance[1]
  maintenance_window       = var.backup_windows_retention_maintenance[2]
  delete_automated_backups = true
  skip_final_snapshot      = true
  deletion_protection      = false

  db_subnet_group_name     = module.vpc.vpc_create_database_subnet_group
  vpc_security_group_ids   = [aws_security_group.rdssql_ingress.id]

  instance_class           = var.rds_db_instance_class

  allocated_storage       = var.storage_allocation[0]
  max_allocated_storage   = var.storage_allocation[1]
  storage_type            = "gp2"
  storage_encrypted       = false
  options                   = []
  create_db_parameter_group = false

  username = var.user_name
  password = var.rdssql_password

  multi_az               = true

  tags = locals.common_tags 
}