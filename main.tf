provider "aws" {
  region = var.region
}

# To create a new IAM role
resource "aws_iam_role" "jayaworld-iam-role" {
  name                  = var.iam_role_name
  path                  = "/"
  permissions_boundary  = var.iam_role_permissions_boundary
  description           = var.iam_role_description
  force_detach_policies = var.force_detach_policies
  assume_role_policy    = var.assume_role_policy
  managed_policy_arns   = var.managed_policy_arns
  dynamic "inline_policy" {
    for_each = var.inline_policy

    content {
      name   = lookup(inline_policy.value, "name", null)
      policy = lookup(inline_policy.value, "policy", null)
    }
  }
  max_session_duration = var.max_session_duration
  tags                 = merge(var.tags)
}

# To create IAM service linked role
resource "aws_iam_service_linked_role" "jayaworld-iam-service-linked-role" {
  count            = var.create_iam_service_linked_role ? 1 : 0
  description      = var.iam_role_description
  aws_service_name = var.aws_service_name
}

# To create SAML Provider
resource "aws_iam_saml_provider" "jayaworld-iam-saml-provider" {
  count                  = var.create_iam_saml_provider ? 1 : 0
  name                   = var.saml_provider_name
  saml_metadata_document = var.saml_metadata_document
}

# To create IAM OpenID Connect provider.
resource "aws_iam_openid_connect_provider" "jayaworld-openid-connect-provider" {
  count           = var.create_iam_oidc ? 1 : 0
  url             = var.oidc_url
  client_id_list  = var.oidc_client_id_list
  thumbprint_list = var.oidc_thumbprint_list
  tags            = merge(var.tags)
}