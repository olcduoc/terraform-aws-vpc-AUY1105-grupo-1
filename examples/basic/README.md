# Ejemplo Básico – Módulo Redes

Este ejemplo muestra el uso básico del módulo `terraform-aws-vpc-AUY1105-grupo-1`
para desplegar la infraestructura de red completa en AWS.

## Recursos que crea

- VPC `10.1.0.0/16`
- Internet Gateway
- Subred pública `10.1.1.0/24` en `us-east-1a`
- Tabla de rutas con salida a Internet
- Security Group con SSH restringido a una IP específica

## Uso

```bash
terraform init
terraform plan
terraform apply
```

## Requisitos

| Herramienta  | Versión mínima |
|--------------|----------------|
| Terraform    | >= 1.5.0       |
| AWS Provider | ~> 5.0         |
