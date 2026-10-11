data "azuredevops_serviceendpoint_npm" "serviceendpoint_npm_lookup" {
  for_each = var.serviceendpoint_npm_lookup

  project_id            = each.value.project_id
  service_endpoint_id   = each.value.service_endpoint_id
  service_endpoint_name = each.value.service_endpoint_name

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      read = timeouts.value.read
    }
  }
}

