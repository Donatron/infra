resource "aws_amplify_app" "portfolio" {
  name     = "portfolio"
  platform = "WEB_COMPUTE"
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