variable "services" {
  description = "ECR repository for services"
  type        = list(string)
  default     = ["payment", "checkout", "product-catalog", "email", "shipping"]
}