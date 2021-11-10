provider "kubernetes" {
  #config_path    = var.kube_config_path
  #config_context = var.kube_config_context
}

resource "kubernetes_namespace" "test_auth_namespace" {
  metadata {
    name = var.kubernetes-namespace
  }
}

resource "kubernetes_config_map" "aws_auth" {
  metadata {
    name = "aws_auth_test"
    namespace = "kube-system"
  }

  data = {
    mapRoles = "mapRoles": "- groups:\n  - system:bootstrappers\n  - system:nodes\n  rolearn: arn:aws:iam::915632791698:role/gabs_eks_workernodes\n  username: system:node:{{EC2PrivateDNSName}}\n- groups:\n  - system:masters\n  rolearn: arn:aws:iam::915632791698:role/ec2_delegate_poweruser_role\n  username: arn:aws:iam::915632791698:role/ec2_delegate_poweruser_role\n"
  }
}
