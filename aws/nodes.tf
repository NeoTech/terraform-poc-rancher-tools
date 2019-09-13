locals {
  cluster_id_tag = {
    "kubernetes.io/cluster/${var.cluster_id}" = "owned"
  }
}

resource "aws_security_group" "allow-all" {
  name        = "rke-default-security-group"
  description = "rke"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = local.cluster_id_tag
}

resource "aws_instance" "rke-node" {
  count = 4
  subnet_id = module.vpc.private_subnets[0]

  ami                    = "ami-25048f5b"
  instance_type          = var.instance_type
  key_name               = aws_key_pair.rke-node-key.id
  iam_instance_profile   = aws_iam_instance_profile.rke-aws.name
  vpc_security_group_ids = [aws_security_group.allow-all.id]
  tags                   = local.cluster_id_tag

  provisioner "remote-exec" {
    connection {
      host        = coalesce(self.public_ip, self.private_ip)
      type        = "ssh"
      user        = "ubuntu"
      private_key = tls_private_key.node-key.private_key_pem
    }

    inline = [
      "curl https://raw.githubusercontent.com/rancher/install-docker/master/19.03.2.sh | bash",
      "sudo usermod -a -G docker ubuntu",
    ]
  }
}

