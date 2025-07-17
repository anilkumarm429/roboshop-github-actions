FROM              docker.io/redhat/ubi9
RUN               curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN               curl -o /etc/yum.repos.d/docker.repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN               dnf install https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm -y
RUN               dnf install libicu make terraform azure-cli docker-ce-cli -y
RUN               curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /bin/kubectl && chmod +x /bin/kubectl
# NODEJS
RUN               dnf module disable nodejs -y && dnf module enable nodejs:22 -y && dnf install nodejs npm -y
# MAVEN
RUN               dnf install maven -y
# HELM
RUN               curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
# ARGOCD
RUN               curl -sSL -o /bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 && chmod +x /bin/argocd
RUN               useradd github
USER              github
WORKDIR           /home/github
RUN               curl -o actions-runner-linux-x64-2.324.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.324.0/actions-runner-linux-x64-2.324.0.tar.gz && tar xzf ./actions-runner-linux-x64-2.324.0.tar.gz
COPY              run.sh /
ENTRYPOINT        ["bash", "/run.sh"]