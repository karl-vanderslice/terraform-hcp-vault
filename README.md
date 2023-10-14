# terraform-hcp-vault

Initialize backend:

```
terraform init \
  -backend-config="region=us-east-2" \
  -backend-config="profile=default" \
  -backend-config="bucket=<bucket from terraform-aws-backend>" \
  -backend-config="key=hcp-bootstrap/terraform.tfstate" \
  -backend-config="dynamodb_table=terraform-lock"
```