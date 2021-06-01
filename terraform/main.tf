module "networking" {
source = "./Modules/vpc"
  region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "${var.vpc_cidr}"
  public_subnets_cidr  = "${var.public_subnets_cidr}"
  private_subnets_cidr = "${var.private_subnets_cidr}"
  availability_zones   = "${var.availability_zones}"
}

module "instance" {
  source      = "./Modules/instances"
  instance_data = "${var.instances}"
  environment = "${var.environment}"
  file = "test.sh"
  security_group = [
    "${module.vpc.aws_security_group.id}"
  ]
}

module "target_groups" {
  source = "./Modules/target_groups"
  tg_data = "${var.target_groups}"
  vpc_id = "${var.vpc_id}"
  environment = "${var.environment}"
}

module "tg_attachment" {
  source = "./Modules/tg_attachment"
  tg_attachment_data = "${var.target_group_attachments}"
  target_group_arn = [
    "${module.target_groups.target_group_id[0]}",
    "${module.target_groups.target_group_id[1]}"
  ]
  target_id = [
    "${module.instance.instance_id[0]}",
    "${module.instance.instance_id[0]}"
  ]
}


module "load_balancer" {
  source = "./Modules/load_balancer"
  lb_data = "${var.load_balancers}"
  lb_subnets = [ #Minimum 2 public subnet ids need to be specified 
  "subnet-8fc01fe6",
  "subnet-a34758e9"
  ]
  lb_security_groups = [ #Only valid for Load Balancers of type application
    "sg-05f271625ceab3b02"  #LB SG
  ]
  environment = "${var.environment}"
}

module "lb_listeners" {
  source = "./Modules/lb_listeners"
  lb_listener_data = "${var.lb_listeners}"
  load_balancer_arn = [
    "${module.load_balancer.load_balancer_id[0]}",
    "${module.load_balancer.load_balancer_id[0]}"
  ]
  target_group_arn = [
    "${module.target_groups.target_group_id[0]}",
    "${module.target_groups.target_group_id[1]}"
  ]
}
