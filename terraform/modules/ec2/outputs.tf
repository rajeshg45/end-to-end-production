output "alb_dns_name"     { value = aws_lb.web.dns_name }
output "ec2_instance_ids" { value = aws_instance.web[*].id }
