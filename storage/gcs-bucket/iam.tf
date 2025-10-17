resource "google_storage_bucket_iam_member" "member" {
  for_each = {
    for member in var.member : "${member.role}-${member.member}" => member
  }
    bucket = google_storage_bucket.this.name    
    role   = each.value.role
    member = each.value.member
}
