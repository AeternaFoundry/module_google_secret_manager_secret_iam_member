resource "google_secret_manager_secret_iam_member" "secret_manager_secret_iam_members" {
  for_each = var.secret_manager_secret_iam_members

  member    = each.value.member
  role      = each.value.role
  secret_id = each.value.secret_id
  project   = each.value.project

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}

