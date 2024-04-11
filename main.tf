module "networking_Module" {
    source = "./module/networking"
    vpc_cidr_block = var.vpc_cidr_block
    public_subnet_cidr_block = var.public_subnet_cidr_block
    private_subnet_cidr_block = var.private_subnet_cidr_block
    region = var.region
}

module "sg_Module" {
    source = "./module/securityGroup"
    vpc_id = module.networking_Module.vpc.id
    depends_on = [ module.networking_Module ]
}

module "certificate_Module" {
    source = "./module/certificate" 
}

module "loadBalancer_Module" {
    source = "./module/loadBalancer"
    loadbalancer_name = var.loadbalancer_name
    lb_security_groups_id = module.sg_Module.lb_securityGroup.id
    private_subnet_id = module.networking_Module.privateSubnet.id
    public_subnet_id = module.networking_Module.publicSubnet.id
    vpc_id = module.networking_Module.vpc.id
    depends_on = [ module.sg_Module , module.networking_Module ]
}

module "Route53_Module" {
    source = "./module/Route53"
    region = var.region
    vpc_id = module.networking_Module.vpc.id
    weblb_dns_name = module.loadBalancer_Module.web_lb.dns_name
    weblb_zone_id = module.loadBalancer_Module.web_lb.zone_id
    depends_on = [ module.loadBalancer_Module, module.networking_Module ]
}

module "cloudwatch_Module" {
  source = "./module/CloudWatch"
  alarm_name = var.alarm_name
  evaluation_periods = var.evaluation_periods
  metric_name = var.metric_name
  namespace = var.namespace
  period = var.period
  alarm_description = var.alarm_description
  sns_topic = var.sns_topic
  cloudwatch_log_group_name = var.cloudwatch_log_group_name
  cloudwatch_log_stream_name = var.cloudwatch_log_stream_name
}

module "autoscaling_Module" {
  source = "./module/AutoScaling"
  ami_id = var.ami_id
  security_group_websg_id = module.sg_Module.web_securityGroup.id
  ansible_playbook_path = var.ansible_playbook_path
  privateSubnetID = module.networking_Module.privateSubnet.id
  autoscale_policy_name_ScaleOut = var.autoscale_policy_name_ScaleOut
  autoscale_adjustment_ScaleOut = var.autoscale_adjustment_ScaleOut
  autoscale_cooldown_ScaleOut = var.autoscale_cooldown_ScaleOut
  autoscale_policy_name_Scalein = var.autoscale_policy_name_Scalein
  autoscale_adjustment_Scalein = var.autoscale_adjustment_Scalein
  autoscale_cooldown_Scalein = var.autoscale_cooldown_Scalein
  autoscale_adjustment_type = var.autoscale_adjustment_type
  depends_on = [ module.sg_Module ,module.networking_Module  ]
}

output "lb_dns_name" {
    value = module.loadBalancer_Module.web_lb.dns_name
}