resource "aws_amplify_app" "portfolio" {
  name       = "portfolio"
  platform   = "WEB_COMPUTE"
  repository = "https://github.com/donatron/portfolio-2025"

  compute_role_arn     = aws_iam_role.amplify_compute.arn
  iam_service_role_arn = aws_iam_role.amplify_service.arn

  environment_variables = {
    EMAIL_ADDRESS = var.email_address
  }

  lifecycle {
    ignore_changes = [
      access_token
    ]
  }
}

resource "aws_amplify_branch" "dev" {
  app_id      = aws_amplify_app.portfolio.id
  branch_name = "dev"

  enable_auto_build = true

  framework = "Next.js - SSR"
  stage     = "DEVELOPMENT"
}

resource "aws_amplify_branch" "main" {
  app_id      = aws_amplify_app.portfolio.id
  branch_name = "main"

  enable_auto_build = true

  framework = "Next.js - SSR"
  stage     = "PRODUCTION"
}