resource "aws_security_group" "k8s-sg" {
  vpc_id      = var.vpc-id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 6443
    to_port          = 6443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 2379
    to_port          = 2380
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 10250
    to_port          = 10250
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 10257
    to_port          = 10257
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 10259
    to_port          = 10259
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 30000
    to_port          = 32767
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "K8S-SG"
  }
}

resource "tls_private_key" "generic-ssh-key" {
  algorithm = "RSA"
  rsa_bits  = 4096

  provisioner "local-exec" {
      interpreter = ["bash", "-c"]
      command = <<EOF
        rm -rf ./keys/*
        cat <<< "${tls_private_key.generic-ssh-key.private_key_openssh}" > ./${path.module}/keys/${var.key-name}.pem
        chmod 400 ./${path.module}/keys/${var.key-name}.pem
      EOF
  }
}

resource "aws_key_pair" "generated_key" {
  key_name   = var.key-name
  public_key = tls_private_key.generic-ssh-key.public_key_openssh
}

resource "aws_instance" "k8s-master" {
    vpc_security_group_ids = [aws_security_group.k8s-sg.id]
    ami = var.ami
    instance_type = var.k8s-master-size
    key_name = var.key-name
    tags = {
        Name = "K8S-Master"
    }

    connection {
      type  = "ssh"
      user = "ubuntu"
      host = self.public_ip
      private_key = tls_private_key.generic-ssh-key.private_key_openssh
    }

    provisioner "file" {
      source = "./${path.module}/scripts"
      destination = "/home/ubuntu/"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo sh /home/ubuntu/scripts/k8s-components-install.sh",
        "sudo kubeadm init",
        "sh /home/ubuntu/scripts/k8s-kubeconfig-cni.sh",
        "rm -rf /home/ubuntu/scripts"
      ]
    }

    provisioner "local-exec" {
        interpreter = ["bash", "-c"]
        command = <<EOF
            rm -rf ./${path.module}/scripts/k8s-kubeadm-join.sh
            ssh ubuntu@${self.public_ip} -o StrictHostKeyChecking=no -i ./${path.module}/keys/${var.key-name}.pem "kubeadm token create --print-join-command" >> ./${path.module}/scripts/k8s-kubeadm-join.sh
        EOF
    }
}

resource "aws_instance" "k8s-worker" {
    depends_on = [
      aws_instance.k8s-master
    ]
    vpc_security_group_ids = [aws_security_group.k8s-sg.id]
    
    ami = var.ami
    instance_type = var.k8s-worker-size
    count = var.k8s-worker-count
    key_name = var.key-name
    tags = {
        Name = "K8S-Worker ${count.index + 1}"
    }

    connection {
      type  = "ssh"
      user = "ubuntu"
      host = self.public_ip
      private_key = tls_private_key.generic-ssh-key.private_key_openssh
    }

    provisioner "file" {
      source = "./${path.module}/scripts"
      destination = "/home/ubuntu/"
    }

    provisioner "remote-exec" {
      inline = [
        "sudo sh /home/ubuntu/scripts/k8s-components-install.sh",
        "sudo sh /home/ubuntu/scripts/k8s-kubeadm-join.sh",
        "rm -rf /home/ubuntu/scripts"
      ]
    }

}