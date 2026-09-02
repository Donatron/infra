variable "budget_notification_emails" {
  description = "Email addresses for AWS budget notifications"
  type        = list(string)
}

variable "email_address" {
  type      = string
  sensitive = true
}