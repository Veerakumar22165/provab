access_key = ""
secret_key = ""

environment = "TEST"

region = "ap-south-1"

availability_zones = [
    "ap-south-1a",
    "ap-south-1b",
    "ap-south-1c"
]

vpc = [
  region               = "${var.region}"
  environment          = "${var.environment}"
  vpc_cidr             = "172.16.0.0/16"
  public_subnets_cidr  = "172.16.1.0/24"
  private_subnets_cidr = "172.168.2.0/24"
]

instances = [
    {
        ami = "ami-01a762e6f057d4dec"
        instance_type = "t2.micro"
        associate_public_ip_address = "1"
        subnet = "subnet-8fc01fe6" 
        securitygroup_ids = "SecurityGroup" 
        key_name = "Visitortracking-demo-client-test"
        user_data = "user_data" 
        #root_volume details:
        root_volume_type = "gp2"
        root_volume_size = "50"
        delete_on_termination = "true"
        #Extra volume details:
        device_name = "/dev/sdh"
        volume_id = "vol-0810995c0c7f99f81"
        #Tags:
        name = "Visitortracking-demo-client-test"
        project = "project1"
    }
]

target_groups = [
    {
        name        = "Web-TG-1"
        port        = "80"
        protocol    = "HTTP"
        target_type = "instance"
        
        health_check_interval = "10" 
        health_check_port = "80"
        health_check_protocol = "HTTP"
        health_check_timeout = "" 
        healthy_threshold = "3"
        unhealthy_threshold = "3"
        path = "/"
        matcher = "200"
    },
    {
        name        = "Web-TG-2"
        port        = "443"
        protocol    = "HTTPS"
        target_type = "instance"
        
        health_check_interval = "10" 
        health_check_port = "443"
        health_check_protocol = "HTTPS"
        health_check_timeout = "" 
        healthy_threshold = "3"
        unhealthy_threshold = "3"
        path = "/"
        matcher = "200"
    }
]

target_group_attachments = [
    {
        target_group_arn = "target group id"  
        target_id = "instance id" 
        port = "80"
    },
    {
        target_group_arn = "target group id"  
        target_id = "instance id" 
        port = "443"
    }
]

load_balancers = [
    {
        name               = "Web-LB"
        load_balancer_type = "application"
        subnets = "Public subnets of websvr"
        security_groups = "Security groups"  
    }
]

lb_listeners = [
    {
        port = "80"
        protocol = "HTTP" 
        ssl_policy = ""
        certificate_arn = "" 

        #default_action
        type       = "forward" 
        target_group = "" 
    },
    {
        port       = "443"
        protocol   = "HTTPS" 
        ssl_policy = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06" 
        certificate_arn = "arn:aws:acm:ap-south-1:785266507373:certificate/b0bbba05-bad9-4455-b675-a12cfb25c206" 

        #default_action
        type       = "forward"
        target_group = "" 
    }
]
