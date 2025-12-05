output "container_fqdn" {
  description = "Public DNS name of the container"
  value       = azurerm_container_group.devops_container.fqdn
}