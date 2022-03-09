module "start" {
    source = "./start"
}

module "s3" {
    source = "./s3"
}

module "networking" {
    source = "./networking"

    availability_zones = var.availability_zones
    private_subnets    = var.private_subnets
    public_subnets     = var.public_subnets
    app_name           = var.app_name
}