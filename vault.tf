resource "helm_release" "vault" {
  count      = data.terraform_remote_state.cluster.outputs.enable_consul_and_vault ? 1 : 0
  repository = "https://helm.releases.hashicorp.com"
  chart      = "vault"
  # version    = "0.25"
  namespace = data.terraform_remote_state.consul.outputs.namespace
  name      = "${data.terraform_remote_state.consul.outputs.release_name}-vault"

  set {
    name  = "server.ha.enabled"
    value = "true"
  }
}