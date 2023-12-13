resource "helm_release" "wordpress" {
  name       = "wordpress"
  namespace = "default"
  repository = "oci://registry-1.docker.io/bitnamicharts"
  chart      = "wordpress"

  values = [
    "${file("word-values.yml")}"
  ]
}

#resource "helm_release" "mysql" {
#  name       = "mysql"
#  namespace = "default"
#  repository = "oci://registry-1.docker.io/bitnamicharts"
#  chart      = "mysql"
#
#  values = [
#    "${file("mysql-values.yml")}"
#  ]
#}
