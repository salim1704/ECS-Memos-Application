output "app_fqdn" {
  description = "Fully qualified domain name of the app"
  value       = aws_route53_record.this.fqdn
}

output "app_url" {
  description = "HTTPS URL of the app"
  value       = "https://${aws_route53_record.this.fqdn}"
}