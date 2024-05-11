# Create zone for my custom domain
# Don't forget to copy the name servers to the custom domain ns
resource "aws_route53_zone" "main" {
  name = "${var.domain_name}"
}

# Create a record for my subdomain in my zone pointing to the alb
resource "aws_route53_record" "subdomain_record_to_alb" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "${var.sub_domain}"
  type    = "A"

  alias {
    name                   = aws_lb.app-lb.dns_name
    zone_id                = aws_lb.app-lb.zone_id
    evaluate_target_health = true
  }
}
