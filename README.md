# Desafio Docker, Terraform e AWS

Repositório para salvar as evidências referentes ao desafio de Docker, Terraform e AWS do Bootcamp de DevOps da Atlântico Avanti.

**Autor**: Sylvio Castanho Jr.

## 1 Atualização do código

Atualizei o código com o script necessário, que é passado para a EC2 via locals do Terraform, e também copiei a pasta app que contém a aplicação e o Dockerfile.

![Codigo](./images/01.png)




## 5 Operações com o Terraform

Primeiro rodei `terraform init`:

![Init](./images/02.png)

Depois executei `terraform validate`, que também é uma boa prática:

![Validate](./images/03.png)

Depois, `terraform plan -var-file=default.tfvars`, utilizando a flag para indicar o arquivo das variáveis não sensíveis (o `.auto.tfvars` é detectado automaticamente). Esse foi o resultado:

<details>

<summary>(clicar na setinha para expandir)</summary>

```
Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # aws_instance.web-server-2 will be created
  + resource "aws_instance" "web-server-2" {
      + ami                                  = "ami-0a0e5d9c7acc336f1"
      + arn                                  = (known after apply)
      + associate_public_ip_address          = (known after apply)
      + availability_zone                    = (known after apply)
      + cpu_core_count                       = (known after apply)
      + cpu_threads_per_core                 = (known after apply)
      + disable_api_stop                     = (known after apply)
      + disable_api_termination              = (known after apply)
      + ebs_optimized                        = (known after apply)
      + get_password_data                    = false
      + host_id                              = (known after apply)
      + host_resource_group_arn              = (known after apply)
      + iam_instance_profile                 = (known after apply)
      + id                                   = (known after apply)
      + instance_initiated_shutdown_behavior = (known after apply)
      + instance_lifecycle                   = (known after apply)
      + instance_state                       = (known after apply)
      + instance_type                        = "t2.micro"
      + ipv6_address_count                   = (known after apply)
      + ipv6_addresses                       = (known after apply)
      + key_name                             = "bt-avanti"
      + monitoring                           = (known after apply)
      + outpost_arn                          = (known after apply)
      + password_data                        = (known after apply)
      + placement_group                      = (known after apply)
      + placement_partition_number           = (known after apply)
      + primary_network_interface_id         = (known after apply)
      + private_dns                          = (known after apply)
      + private_ip                           = (known after apply)
      + public_dns                           = (known after apply)
      + public_ip                            = (known after apply)
      + secondary_private_ips                = (known after apply)
      + security_groups                      = (known after apply)
      + source_dest_check                    = true
      + spot_instance_request_id             = (known after apply)
      + subnet_id                            = (known after apply)
      + tags                                 = {
          + "Type" = "web-server"
        }
      + tags_all                             = {
          + "Desafio" = "2"
          + "Name"    = "bt-avanti"
          + "Type"    = "web-server"
        }
      + tenancy                              = (known after apply)
      + user_data                            = "6986cd66497886879852de8c62f7b3f9bb7c87c3"
      + user_data_base64                     = (known after apply)
      + user_data_replace_on_change          = false
      + vpc_security_group_ids               = (known after apply)

      + capacity_reservation_specification (known after apply)

      + cpu_options (known after apply)

      + ebs_block_device (known after apply)

      + enclave_options (known after apply)

      + ephemeral_block_device (known after apply)

      + instance_market_options (known after apply)

      + maintenance_options (known after apply)

      + metadata_options (known after apply)

      + network_interface (known after apply)

      + private_dns_name_options (known after apply)

      + root_block_device (known after apply)
    }

  # aws_security_group.bt-avantiSG will be created
  + resource "aws_security_group" "bt-avantiSG" {
      + arn                    = (known after apply)
      + description            = "Allow incoming HTTP, HTTPS e SSH connections."
      + egress                 = [
          + {
              + cidr_blocks      = [
                  + "0.0.0.0/0",
                ]
              + from_port        = 0
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "-1"
              + security_groups  = []
              + self             = false
              + to_port          = 0
                # (1 unchanged attribute hidden)
            },
        ]
      + id                     = (known after apply)
      + ingress                = [
          + {
              + cidr_blocks      = [
                  + "(meu-ip)/32",
                ]
              + description      = "HTTP to EC2"
              + from_port        = 80
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 80
            },
          + {
              + cidr_blocks      = [
                  + "(meu-ip)/32",
                ]
              + description      = "HTTPS to EC2"
              + from_port        = 443
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 443
            },
          + {
              + cidr_blocks      = [
                  + "(meu-ip)/32",
                ]
              + description      = "SSH to EC2"
              + from_port        = 22
              + ipv6_cidr_blocks = []
              + prefix_list_ids  = []
              + protocol         = "tcp"
              + security_groups  = []
              + self             = false
              + to_port          = 22
            },
        ]
      + name                   = "bt-avantiSG"
      + name_prefix            = (known after apply)
      + owner_id               = (known after apply)
      + revoke_rules_on_delete = false
      + tags                   = {
          + "Type" = "security-group"
        }
      + tags_all               = {
          + "Desafio" = "2"
          + "Name"    = "bt-avanti"
          + "Type"    = "security-group"
        }
      + vpc_id                 = (known after apply)
    }

Plan: 2 to add, 0 to change, 0 to destroy.
```

</details>


Após revisar e parecer ok, executei o `terraform apply -var-file=default.tfvars`, confirmando a operação:

![Apply](./images/04.png)


## 6 Validando o resultado

Verificou-se que a EC2 foi criada com sucesso:

![EC2](./images/05.png)

Também foi possível se conectar com a EC2 utilizando SSH:

```
chmod 400 "bt-avanti.pem" #(precisei mover a chave do /mnt/ para ~/ no WSL pois esse comando é para Linux)
ssh -i "bt-avanti.pem" ubuntu@ec2-(ip)-compute-1.amazonaws.com
```

Checando o website no navegador:

![Site 1](./images/06.png)

![Site 2](./images/07.png)


## 7 Terraform destroy 

Para remover a EC2 e o Security Group foi executado `terraform destroy -var-file=default.tfvars`:

![Destroy](./images/08.png)

E `aws sso logout` no final.

