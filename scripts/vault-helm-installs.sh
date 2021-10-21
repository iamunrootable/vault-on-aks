# Add the helm repo
helm repo add hashicorp https://helm.releases.hashicorp.com

# Update helm repos
helm repo update

# Search for all of the Vault Helm versions
helm search repo vault --versions

# Install the latest version of the Vault Helm chart with the Web UI enabled.
helm install vault hashicorp/vault \
  --set='ui.enabled=true' \
  --set='ui.serviceType=LoadBalancer'
