resource "aws_route53_zone" "tf_route53_zone" {
  name              = "${var.domain}.click"
  delegation_set_id = var.delegation_set
}

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.tf_route53_zone.zone_id
  name    = "www.${var.domain}.click"
  type    = "A"

  alias {
    name                   = aws_elb.terraform-elb.dns_name
    zone_id                = aws_elb.terraform-elb.zone_id
    evaluate_target_health = false
  }
}
