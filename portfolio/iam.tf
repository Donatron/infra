data "aws_iam_policy_document" "amplify_compute_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "amplify_compute" {
  name               = "portfolio-amplify-compute"
  assume_role_policy = data.aws_iam_policy_document.amplify_compute_assume_role.json
}

data "aws_iam_policy_document" "amplify_ssm_access" {
  statement {
    effect = "Allow"

    actions = [
      "ssm:GetParameter",
    ]

    resources = [
      "arn:aws:ssm:ap-southeast-2:${data.aws_caller_identity.current.account_id}:parameter/portfolio/resend-api-key",
    ]
  }
}

resource "aws_iam_role_policy" "amplify_ssm_access" {
  name   = "portfolio-resend-ssm"
  role   = aws_iam_role.amplify_compute.id
  policy = data.aws_iam_policy_document.amplify_ssm_access.json
}

data "aws_iam_policy_document" "amplify_service_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["amplify.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "amplify_service" {
  name               = "portfolio-amplify-service"
  assume_role_policy = data.aws_iam_policy_document.amplify_service_assume_role.json
}

resource "aws_iam_role_policy_attachment" "amplify_service" {
  role       = aws_iam_role.amplify_service.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess-Amplify"
}
