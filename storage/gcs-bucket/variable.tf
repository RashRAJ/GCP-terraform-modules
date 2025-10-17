variable "bucket_name" {
  description = "The name of the bucket. Must be globally unique."
  type        = string
}

variable "location" {
  description = "The location of the bucket."
  type        = string
  default     = "US"
}

variable "project_id" {
  description = "The ID of the project in which the bucket will be created."
  type        = string
}
variable "member" {
  description = "A list of IAM members to assign to the bucket."
  type = list(object({
    role   = string
    member = string
  }))
  default = []
}

variable "labels" {
  description = "A map of labels to assign to the bucket."
  type        = map(string)
  default     = {}
}