provider "google" {
  project     = var.project_id
  region      = var.region
  credentials = file(var.google_credentials_file)
}

# Step 1: Create a GCS Bucket
resource "google_storage_bucket" "my_bucket" {
  name          = var.bucket_name
  location      = var.region
  storage_class = "STANDARD"

  versioning {
    enabled = true   # Step 3: Enable Object Versioning
  }
}

# Step 2: Configure IAM Policy for Public or Private Access
resource "google_storage_bucket_iam_member" "public_access" {
  count  = var.is_public ? 1 : 0  # If public, apply IAM policy
  bucket = google_storage_bucket.my_bucket.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"  # Public access for all users
}

resource "google_storage_bucket_iam_member" "private_access" {
  count  = var.is_public ? 0 : 1  # If private, do not apply public access
  bucket = google_storage_bucket.my_bucket.name
  role   = "roles/storage.admin"
  member = "user:${var.private_user_email}"
}
