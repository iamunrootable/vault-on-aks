# State file for the tageted AKS cluster
data "terraform_remote_state" "aks" {
    backend = "local"
    config = {
        path = "../aks-cluster/terraform.tfstate"
    }
}

