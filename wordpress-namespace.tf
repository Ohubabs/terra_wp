resource "kubernetes_namespace_v1" "logs-namespace" {
  metadata {
    name = "wp"
  }
}
