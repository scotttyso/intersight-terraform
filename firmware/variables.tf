/*
*** main.tf Variables **
*/
variable "api_key" {
    description = "API Key for Terraform Demo Account. Generate this in Intersight under; Settings > API Key: [Generate a Key]"
    type        = string
}

variable "endpoint" {
    description = "Intersight API endpoint.  URL below is for SaaS, need on-premise URL if used."
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