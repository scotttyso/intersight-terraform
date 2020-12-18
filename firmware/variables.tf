# https://intersight.com/an/settings/api-keys/
# Generate API key to obtain the API Key and PEM file

variable "api_key" {
    description = "API Key for Terraform Demo Account"
    type        = string
}

variable "endpoint" {
    description = "Intersight API endpoint"
    type        = string
    default     = "https://intersight.com"
}

variable "image" {
    description = "Define the image to use"
    type        = string
    default   = "ucs-intersight-server-b200-m5.4.1.2b.gbin"
}

variable "object_type" {
    description = "Define if Blade or Rackmount"
    type        = string
    default   = "compute.Blade"
    # default     = "compute.RackUnit"
}

variable "organization" {
    description = "Which Organization in Intersight"
    type        = string
    default   = "IMM"
}


variable "serial" {
    description = "Define the Serial Number of the Server"
    type        = string
    default   = "FCH21427CHB"
}

variable "secretkeyfile" {
    description = "Filename (PEM Format) that provides secret key for Terraform Account"
    type        = string
    default     = "../../SecretKey.txt"
}