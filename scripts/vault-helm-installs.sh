# Add the helm repo
helm repo add hashicorp https://helm.releases.hashicorp.com

# Update helm repos
helm repo update

# Search for all of the Vault Helm versions
helm search repo vault --versions