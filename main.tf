provider "kubernetes" {
  #config_path    = var.kube_config_path
  #config_context = var.kube_config_context
}

resource "kubernetes_namespace" "test_auth_namespace" {
  metadata {
    name = var.kubernetes-namespace
  }
}

resource "kubernetes_config_map" "example_richard_gabs" {
  metadata {
    name = "my-tf-lab-config"
    #namespace = "kube-system"
  }

  data = {
    api_host             = "myhost:443"
    db_host              = "dbhost:5432"
  }
}
