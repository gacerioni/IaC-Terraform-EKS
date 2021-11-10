provider "kubernetes" {
  config_path    = var.kube_config_path
  config_context = var.kube_config_context
}

resource "kubernetes_namespace" "test_auth_namespace" {
  metadata {
    name = var.kubernetes-namespace
  }
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name = "aws-auth-test"
    namespace = "kube-system"
  }

  data = {
    mapRoles = "TEST"
  }
}
