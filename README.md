# terraform-aws-vpc-AUY1105-grupo-1

## 1. Descripción

Módulo Terraform reutilizable para la creación de infraestructura de red en AWS.
Gestiona la VPC, Internet Gateway, subredes públicas, tabla de rutas y Security Group con acceso SSH restringido.

## 2. Objetivos

- Desacoplar la lógica de red del repositorio principal para mayor reutilización.
- Parametrizar todos los recursos de red mediante variables.
- Exponer outputs estándar para integración con otros módulos.

## 3. Recursos creados

| Recurso                       | Descripción                             |
|-------------------------------|-----------------------------------------|
| `aws_vpc`                     | Red privada virtual con DNS habilitado  |
| `aws_internet_gateway`        | Gateway de salida a Internet            |
| `aws_subnet`                  | Subredes públicas con máscara /24       |
| `aws_route_table`             | Tabla de rutas para subredes públicas   |
| `aws_route`                   | Ruta por defecto hacia Internet         |
| `aws_route_table_association` | Asociación subnet ↔ route table         |
| `aws_security_group`          | SG con SSH restringido a IP específica  |

## 4. Variables

| Variable              | Tipo           | Requerida | Descripción                                         |
|-----------------------|----------------|-----------|-----------------------------------------------------|
| `project_name`        | `string`       | ✅        | Nombre base para etiquetar los recursos             |
| `vpc_cidr`            | `string`       | ❌        | CIDR de la VPC (default: `10.1.0.0/16`)             |
| `public_subnet_cidrs` | `list(string)` | ❌        | CIDRs de subredes públicas (default: `10.1.1.0/24`) |
| `availability_zones`  | `list(string)` | ❌        | Zonas de disponibilidad (default: `us-east-1a`)     |
| `ssh_allowed_cidr`    | `string`       | ✅        | IP/CIDR autorizado para SSH. **No usar 0.0.0.0/0**  |

## 5. Outputs

| Output              | Descripción                               |
|---------------------|-------------------------------------------|
| `vpc_id`            | ID de la VPC creada                       |
| `subnet_ids`        | Lista de IDs de las subredes públicas     |
| `security_group_id` | ID del Security Group con SSH restringido |

## 6. Instrucciones de uso

```hcl
module "redes" {
  source = "github.com/osleivac/terraform-aws-vpc-AUY1105-grupo-1"

  project_name        = "AUY1105-GRUPO-Nro1"
  vpc_cidr            = "10.1.0.0/16"
  public_subnet_cidrs = ["10.1.1.0/24"]
  availability_zones  = ["us-east-1a"]
  ssh_allowed_cidr    = "TU_IP/32"
}
```

Ver ejemplo completo en [examples/basic](./examples/basic).

## 7. Versionado

Este módulo sigue [Semantic Versioning](https://semver.org/). Ver [CHANGELOG.md](./CHANGELOG.md).

---

**Integrantes:** Juan Pablo - Oscar Leiva
**Docente:** Camilo Jerez
**Institución:** Duoc UC - 2026
