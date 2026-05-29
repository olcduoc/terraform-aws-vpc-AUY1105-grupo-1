# ─────────────────────────────────────────────────────────────
# outputs.tf  –  Módulo Redes AUY1105-grupo-1
# ─────────────────────────────────────────────────────────────

output "vpc_id" {
  description = "ID de la VPC creada."
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "Lista de IDs de las subredes públicas creadas."
  value       = aws_subnet.public[*].id
}

output "security_group_id" {
  description = "ID del Security Group creado (acceso SSH restringido)."
  value       = aws_security_group.this.id
}
