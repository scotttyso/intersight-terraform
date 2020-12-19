# https://intersight.com/an/settings/api-keys/
# Generate API key to obtain the API Key and PEM file

variable "api_key" {
    description = "API Key for Terraform Demo Account"
    type        = string
}

variable "secretkeyfile" {
    description = "Filename (PEM) that provides secret key for Terraform Demo Account"
    type        = string
    default     = "/home/tyscott/SecretKey.txt"
}

variable "endpoint" {
    description = "Intersight API endpoint"
    type        = string
    default     = "https://intersight.com"
}
