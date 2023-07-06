#/bin/bash

        # First diasbale swap
        sudo swapoff -a 1>/dev/null
        # And then to disable swap on startup in /etc/fstab
        sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab 1>/dev/null

        apt-get install -y apt-transport-https 1>/dev/null
        curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add > /dev/null 2>&1
        echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list

        apt-get update > /dev/null 2>&1

        curl -fsSL https://get.docker.com -o get-docker.sh 
        sh get-docker.sh > /dev/null 2>&1

        echo "{ \n \"exec-opts\": [\"native.cgroupdriver=systemd\"]\n}" > /etc/docker/daemon.json
        systemctl daemon-reload 1>/dev/null
        systemctl restart docker 1>/dev/null

        apt-get install -y kubelet=1.23.8-00 1>/dev/null
        apt-get install -y kubeadm=1.23.8-00 1>/dev/null
        apt-get install -y kubectl=1.23.8-00 1>/dev/null
        apt-get install -y kubernetes-cni 1>/dev/null

exit
