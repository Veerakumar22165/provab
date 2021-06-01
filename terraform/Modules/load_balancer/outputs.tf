output "load_balancer_id" {
  value = "${aws_lb.load_balancer.*.id}"
}

output "load_balancer_dns_name" {
  value = "${aws_lb.load_balancer.*.dns_name}"
}
