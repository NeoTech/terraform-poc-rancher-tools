output "private_key" {
  value = module.nodes.private_key
}

output "ssh_username" {
  value = "ubuntu"
}

output "addresses" {
  value = module.nodes.addresses
}

output "kubeconfig" {
 value = rke_cluster.cluster.kube_config_yaml
}

