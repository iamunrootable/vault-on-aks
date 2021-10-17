# login to azure
az login

# create an Active Directory service principal account using the Azure CLI.
az ad sp create-for-rbac -n "vault"