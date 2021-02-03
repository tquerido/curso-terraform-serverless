resource "aws_dynamodb_table" "users" {
  hash_key = "id"
  name = "${var.environment}-users"
  attribute {
    name = "id"
    type = "S"
  }
  write_capacity = var.write_capacity
  read_capacity = var.read_capacity
}

resource "aws_ssm_parameter" "dynamodb-users-table" {
  name = "${var.environment}-dynamodb-users-table"
  type = "String"
  value = aws_dynamodb_table.users.name
}