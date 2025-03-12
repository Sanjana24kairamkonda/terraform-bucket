variable "project_id" {
  description = "GCP Project ID"
  type        = string
}

variable "google_credentials_file" {
  description = "Path to the Google Cloud service account key file"
  type        = string
}

variable "bucket_name" {
  description = "Name of the GCS bucket"
  type        = string
}

variable "region" {
  description = "GCP Region for the bucket"
  type        = string
  default     = "us-central1"
}

variable "is_public" {
  description = "Set to true to make the bucket public, false for private"
  type        = bool
  default     = false
}

variable "private_user_email" {
  description = "Email of the user with private access"
  type        = string
}
