output "primary_load_balancer_url" {
  description = "URL to access the application in the primary region"
  value       = module.ec2_primary.alb_dns_name
}

output "secondary_load_balancer_url" {
  description = "URL to access the application in the secondary region"
  value       = module.ec2_secondary.alb_dns_name
}