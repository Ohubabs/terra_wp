#resource "kubernetes_ingress_v1" "wordpress-ingress" {
#  wait_for_load_balancer = true
#  metadata {
#    name = "wordpress-ingress"
#    namespace = "default"
#    annotations = {
#        "alb.ingress.kubernetes.io/load-balancer-name" = "wordpress"
#        "alb.ingress.kubernetes.io/scheme"             = "internet-facing"
#        "alb.ingress.kubernetes.io/target-type"        = "ip"                                       
#        "alb.ingress.kubernetes.io/certificate-arn" = "arn:aws:acm:us-west-2:083772204804:certificate/58e604e3-40aa-4644-b0ad-8663f8e67c2a"
#  }
#  }
#  spec {
#    ingress_class_name = "alb"
#    default_backend {
#      service {
#        name = "wordpress"
#        port {
#          number = 80
#        }
#      }
#    }
#    rule {
#      host = "wordpress.devopsnetwork.net"  
#      http {
#        path {
#          path = "/"
#          path_type = "Exact"
#          backend {
#            service {
#              name = "mattermost-team-edition"
#              port {
#                number = 80
#              }
#            }
#          }
#        }
#      }
#    }
#  }
#}

##NGINX

resource "kubernetes_ingress_v1" "wordpress-ingress" {
  wait_for_load_balancer = true
  metadata {
    name = "wordpress"
    namespace = "wp"
    annotations = {
        "cert-manager.io/cluster-issuer" = "wordpress-issuer"
  }
  }
  spec {
    ingress_class_name = "nginx"
    tls {
      secret_name = "wordpress-secret"
      hosts = ["wordpress.devopsnetwork.net"] 
    }
    rule {
      host = "wordpress.devopsnetwork.net"  
      http {
        path {
          path = "/"
          backend {
            service {
              name = "wordpress"
              port {
                number = 80
              }
            }
          }
        }
      }
    }
  }
}
