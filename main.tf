provider "aws" {
  region = var.region
}

# To create a new IAM role
resource "aws_iam_role" "jayaworld-iam-role" {
  name = var.iam_role_name
  path = "/"
  permissions_boundary = var.iam_role_permissions_boundary
  description = var.iam_role_description
  force_detach_policies = var.force_detach_policies
  assume_role_policy = var.assume_role_policy
  managed_policy_arns = var.managed_policy_arns
  dynamic "inline_policy" {
    for_each = var.iamrole_inline_policy == null ? [] : var.iamrole_inline_policy
    content {
    name = lookup(inline_policy.value.name, null)
    policy = lookup(inline_policy.value.policy, null)
    }
  }
  max_session_duration = var.max_session_duration
  tags = merge(var.tags)
}