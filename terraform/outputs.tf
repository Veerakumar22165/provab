output "instance_id" {
  value = "${module.instance.instance_id}"
}

output "instance_public_ip" {
  value = "${module.instance.instance_public_ip}"
}

output "instance_private_ip" {
  value = "${module.instance.instance_private_ip}"
}

output "root_block_device_id" {
  value = "${module.instance.root_block_device_id}"
}


output "target_group_id" {
  value = "${module.target_groups.target_group_id}"
}

output "load_balancer_id" {
  value = "${module.load_balancer.load_balancer_id}"
}

output "load_balancer_dns_name" {
  value = "${module.load_balancer.load_balancer_dns_name}"
}

output "load_balancer_listener_id" {
  value = "${module.lb_listeners.lb_listener_id}"
}