resource "helm_release" "vault" {
  count     = data.terraform_remote_state.cluster.outputs.enable_consul_and_vault ? 1 : 0
  repository = "https://helm.releases.hashicorp.com"
  chart     = "vault"
  name      = "${data.terraform_remote_state.consul.outputs.release_name}-vault"
  chart      = "vault"
  # version    = "0.25"
  namespace = data.terraform_remote_state.consul.outputs.namespace

  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}