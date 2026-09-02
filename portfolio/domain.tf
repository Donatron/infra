resource "aws_amplify_domain_association" "portfolio" {
  app_id                = aws_amplify_app.portfolio.id
  domain_name           = "donatron.au"
  wait_for_verification = false

  sub_domain {
    branch_name = aws_amplify_branch.dev.branch_name
    prefix      = "dev"
  }

  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = ""
  }

  sub_domain {
    branch_name = aws_amplify_branch.main.branch_name
    prefix      = "www"
  }
}
