# ─────────────────────────────────────────────────────────────
# variables.tf  –  Módulo Redes AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

variable "project_name" {
  description = "Nombre base del proyecto, usado para etiquetar todos los recursos."
  type        = string
}

variable "vpc_cidr" {
  description = "Bloque CIDR principal de la VPC (ej: 10.1.0.0/16)."
  type        = string
  default     = "10.1.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "Lista de bloques CIDR para las subredes públicas (máscara /24 requerida)."
  type        = list(string)
  default     = ["10.1.1.0/24"]
}

variable "availability_zones" {
  description = "Lista de zonas de disponibilidad para las subredes públicas."
  type        = list(string)
  default     = ["us-east-1a"]
}

variable "ssh_allowed_cidr" {
  description = "CIDR IP autorizado para acceso SSH. No usar 0.0.0.0/0."
  type        = string
}
