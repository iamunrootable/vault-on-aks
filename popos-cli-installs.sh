# Ensure Azure-CLI is installed
# https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt
#
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Ensure kubctl-CLI is installed 
# https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
# Latest release binary:
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
# Install
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Ensure helm-cli is installed
# https://helm.sh/docs/intro/install/
# Install latest version using the following installer script
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh


#prerequisite:
"Feature Microsoft.ContainerService/AutoUpgradePreview is not enabled
