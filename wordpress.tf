resource "helm_release" "wordpress" {
  name       = "wordpress"
  create_namespace = true
  namespace  = "wp"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "wordpress"

  values = [
    "${file("word-values.yml")}"
  ]
}

#resource "helm_release" "mysql" {
#  name       = "mysql"
#  create_namespace = true
#  namespace = "wp"
#  repository = "oci://registry-1.docker.io/bitnamicharts"
#  chart      = "mysql"
#
#  values = [
#    "${file("mysql-values.yml")}"
#  ]
#}
