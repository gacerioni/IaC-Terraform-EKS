#EKS variables.
variable "region" {
  default = "us-east-1"
}

variable "kube_config_path" {
  default = ""
}

variable "kube_config_context" {
  default = "arn:aws:eks:sa-east-1:915632791698:cluster/gabs-quick-terraform-lab"
}

variable "eks_cluster_name" {
  default = "arn:aws:eks:sa-east-1:915632791698:cluster/gabs-quick-terraform-lab"
}

variable "kubernetes-namespace" {
    default = "gabs-exec-delegate-ns"
}
