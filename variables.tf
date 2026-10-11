variable "secret_manager_secret_iam_members" {
  description = <<EOT
Map of secret_manager_secret_iam_members, attributes below
Required:
    - member
    - role
    - secret_id
Optional:
    - project
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    member    = string
    role      = string
    secret_id = string
    project   = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

