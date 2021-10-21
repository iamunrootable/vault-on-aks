# Configure authentication to the K8s cluter
provider "helm" {
    Kubernetes {
        host = data.azurerm_kubernetes_cluster.vault-cluster.kube_config.0.host
        client_certificate = base64decode(data.azurerm_kubernetes_cluster.vault-cluster.kube_config.0.client_certificate)
        client_key = base64decode(data.azurerm_kubernetes_cluster.vault-cluster.kube_config.0.client_key)  
        cluster_ca_certificate = base64decode(data.azurerm_kubernetes_cluster.credentials.kube_config.0.cluster_ca_certificate)

    }
}

# The helm_release resource specifies the chart name and the configuration variables for your deployment.
resource "helm_release" "vault" {  
    name  = "vault"  
    repository = "https://helm.releases.hashicorp.com/vault"  
    chart      = "vault"
    values = [    
        file("${path.module}/kubewatch-values.yaml") 
    ]

    set {
    server.ha.enabled = true
    server.ha.raft.enabled= true
  }
}
