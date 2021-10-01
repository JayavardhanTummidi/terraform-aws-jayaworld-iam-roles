variable "region" {
    description = "specify region name"
    type = string
    default = "us-east-1"
}

variable "iam_role_name" {
    description = "Friendly name of the role. If omitted, Terraform will assign a random, unique name"
    type = string
    default = ""
}

variable "iam_role_permissions_boundary" {
    description = "ARN of the policy that is used to set the permissions boundary for the role."
    type = string
    default = ""
}

variable "iam_role_description" {
    description = "Description of the role."
    type = string
    default = ""
}

variable "force_detach_policies" {
    description = "Whether to force detaching any policies the role has before destroying it. Defaults to false. But i prefer the value true"
    type = string
    default = "true"
}

variable "assume_role_policy" {
    description = "Policy that grants an entity permission to assume the role."
    type = string    
}

variable "managed_policy_arns" {
    description = "Set of exclusive IAM managed policy ARNs to attach to the IAM role. If this attribute is not configured, Terraform will ignore policy attachments to this resource. When configured, Terraform will align the role's managed policy attachments with this set by attaching or detaching managed policies. Configuring an empty set (i.e., managed_policy_arns = []) will cause Terraform to remove all managed policy attachments."
    type = list(string)
    default = []
}

variable "iamrole_inline_policy" {
    description = "iamrole_inline_policy creation "
    type = any
    default = {
        name = null
        policy = null
    }
}

variable "max_session_duration" {
    description = "Maximum session duration (in seconds) that you want to set for the specified role. If you do not specify a value for this setting, the default maximum of one hour is applied. This setting can have a value from 1 hour to 12 hours."
    type = number
    default = "3000"
}

variable "tags" {
    description = "Key-value mapping of tags for the IAM role. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
    type = map(string)
    default = {}
}