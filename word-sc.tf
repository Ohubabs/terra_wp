resource "kubernetes_storage_class" "wordpress-sc" {
  metadata {
    name = "wordpress-sc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "Immediate"
  parameters = {
    type = "gp2"
  }
}

resource "kubernetes_storage_class" "maria-sc" {
  metadata {
    name = "maria-sc"
  }
  storage_provisioner = "ebs.csi.aws.com"
  reclaim_policy      = "Retain"
  volume_binding_mode = "Immediate"
  parameters = {
    type = "gp2"
  }
}


#resource "kubernetes_storage_class" "mysql-sc" {
#  metadata {
#    name = "mysql-sc"
#  }
#  storage_provisioner = "ebs.csi.aws.com"
#  reclaim_policy      = "Retain"
#  volume_binding_mode = "Immediate"
#  parameters = {
#    type = "gp2"
#  }
#}
