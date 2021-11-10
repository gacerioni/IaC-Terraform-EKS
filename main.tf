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
    name      = "aws-auth"
    namespace = "kube-system"
  }

  data = {
    mapRoles = [{"groups":["system:bootstrappers","system:nodes"],"rolearn":"arn:aws:iam::915632791698:role/gabs_eks_workernodes","username":"system:node:{{EC2PrivateDNSName}}"},{"groups":["system:masters"],"rolearn":"arn:aws:iam::915632791698:role/ec2_delegate_poweruser_role","username":"arn:aws:iam::915632791698:role/ec2_delegate_poweruser_role"}]
  }
}
