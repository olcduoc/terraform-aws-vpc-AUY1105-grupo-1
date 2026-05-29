# ─────────────────────────────────────────────────────────────
# examples/basic/main.tf
# Ejemplo de uso del módulo redes terraform-aws-vpc-AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

provider "aws" {
  region = "us-east-1"
}

module "redes" {
  source = "github.com/osleivac/terraform-aws-vpc-AUY1105-grupo-1"

  project_name        = "AUY1105-GRUPO-Nro1"
  vpc_cidr            = "10.1.0.0/16"
  public_subnet_cidrs = ["10.1.1.0/24"]
  availability_zones  = ["us-east-1a"]
  ssh_allowed_cidr    = "181.43.52.214/32"
}

output "vpc_id" {
  value = module.redes.vpc_id
}

output "subnet_ids" {
  value = module.redes.subnet_ids
}

output "security_group_id" {
  value = module.redes.security_group_id
}
