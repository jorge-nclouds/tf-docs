# Terraform Relational Database Service (RDS Cluster)
Documentation on how terraform templates are being structured and managed
## Folder Structure

```shell
├── rdsAurora
│   ├── backend.tf
│   ├── config
│   │   ├── backend
│   │   │   ├── development.tfvars
│   │   │   └── production.tfvars
│   │   ├── dev.tfvars
│   │   └── prod.tfvars
│   ├── data.tf
│   ├── main.tf
│   ├── module
│   │   ├── locals.tf
│   │   ├── main.tf
│   │   ├── README.md
│   │   └── variables.tf
│   ├── provider.tf
│   ├── README.md
│   └── variables.tf
```

Where: 

- **rdsAurora**: Main folder where terraform commands needs to be executed. This folder holds the main terraform templates to create rds Aurora cluster with db instances needed.
    - **config**: Stores all the variables files that are needed to execute terraform plan/apply commands.
        - **backend**: Stores terraform backend values while executing terraform init command, needed to target the multi-account settup.
    - **module**: Contain terraform templates to deploy a single rds aurora cluster resource. [Module README](./module/README.md)

### Export AWS credentials

There is a need to export AWS credentials to your terminal in order to run terraform templates and manage the resources, to get your credentials,
log in into GetRev-sso and click on *Command line or programmatic access* based on the account you want to manage.
You will see the instructions to export credentials based on SO and terminal, where you can copy and paste the credentials on your terminal.

## General information on how to use terraform templates to apply configuration/infrastructure changes

1. Open a terminal on a terraform project folder (rdsAurora)

   (as in open a terminal in `$projectroot/new-prod-account-migration/applicationLayer/1-storageInfra/rdsAurora`)

2. Export your credentials based on the account (Rev SSO) you are going to manage

3. Initialize terraform modules, providers and terraform backend depending on the envrionment you are going to manage.

    - **Production:** `terraform init --backend-config ./config/backend/production.tfvars -reconfigure`
    - **Development:** `terraform init --backend-config ./config/backend/development.tfvars -reconfigure`

       If you receive an error as an output, try to export you credentials again, as you might exported the wrong ones.
   
4. Run terraform plan command appending the variable config file to it; e.g. `terraform apply -var-file <PATH TO CONFIG FILE>`
   - **example:** `terraform plan -var-file ./config/production.tfvars`
7. Run terraform apply command appending the variable config file to it; e.g. `terraform apply -var-file <PATH TO CONFIG FILE>`
   - **example:** `terraform apply -var-file ./config/production.tfvars`

<!-- BEGIN_TF_DOCS -->
## Requirements
<!-- END_TF_DOCS -->