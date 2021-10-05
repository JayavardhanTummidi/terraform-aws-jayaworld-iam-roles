> **Thanks for using Jaya world modules**

> **Example to create new IAM role with Assume Role policy to trust the entities**

module "jayaworld-iam-roles" {

  source  = "app.terraform.io/jaya-world/jayaworld-iam-roles/aws"

  version = "0.9.0"

  # insert required variables here

  iam_role_name = "jaya-world-iam-role"

  assume_role_policy = file("./policy.json")  # You can also pass the value as JSON format

> **To pass custom or inline policy to the IAM role**

  inline_policy = [{

    name   = "jaya-world-iam-role"

    policy = file("./rds.policy")  # You can also pass the value as JSON format


  }]

> **To pass AWS Managed policy to the IAM role**

   managed_policy_arns  =  ["arn:aws:iam::aws:policy/AmazonEC2FullAccess"]


> **To create IAM Service linked role**

   create_iam_service_linked_role = true

   aws_service_name    =  "elasticbeanstalk.amazonaws.com"


> **To create SAML Provider**

   create_iam_saml_provider  = true

   saml_provider_name = "aws-provider"

   saml_metadata_document = file("./saml-metadata.xml")


> **To create IAM OIDC Provider**

   create_iam_oidc = true

   oidc_url = "https://accounts.google.com"

   oidc_client_id_list = ["266362248691-342342xasdasdasda-apps.googleusercontent.com"]

   oidc_thumbprint_list = []


}