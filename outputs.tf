output "arn" {
  description = "Amazon Resource Name (ARN) specifying the role."
  value       = aws_iam_role.jayaworld-iam-role.arn
}

output "create_date" {
  description = "Creation date of the IAM role."
  value       = aws_iam_role.jayaworld-iam-role.create_date
}

output "id" {
  description = "Name of the role."
  value       = aws_iam_role.jayaworld-iam-role.id
}

output "name" {
  description = "Name of the role."
  value       = aws_iam_role.jayaworld-iam-role.name
}

output "unique_id" {
  description = "Stable and unique string identifying the role."
  value       = aws_iam_role.jayaworld-iam-role.unique_id
}