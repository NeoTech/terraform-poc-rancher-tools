module "nodes" {
  source = "./aws"
  cluster_id    = "nutrien-poc-rke"
}

resource "rke_cluster" "cluster" {
  cloud_provider {
    name = "aws"
  }

  nodes {
    address = module.nodes.addresses[0]
    user    = module.nodes.ssh_username
    ssh_key = module.nodes.private_key
    role    = ["controlplane", "etcd"]
  }
  nodes {
    address = module.nodes.addresses[1]
    user    = module.nodes.ssh_username
    ssh_key = module.nodes.private_key
    role    = ["worker"]
  }
  nodes {
    address = module.nodes.addresses[2]
    user    = module.nodes.ssh_username
    ssh_key = module.nodes.private_key
    role    = ["worker"]
  }
  nodes {
    address = module.nodes.addresses[3]
    user    = module.nodes.ssh_username
    ssh_key = module.nodes.private_key
    role    = ["worker"]
  }
}

resource "local_file" "kube_cluster_yaml" {
  filename = "./kube_config_cluster.yml"
  content  = rke_cluster.cluster.kube_config_yaml
}