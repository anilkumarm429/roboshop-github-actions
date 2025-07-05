FROM              docker.io/redhat/ubi9
RUN               curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN               dnf install https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm -y
RUN               dnf install libicu make terraform azure-cli -y
RUN               curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /bin/kubectl && chmod +x /bin/kubectl
RUN               useradd github
USER              github
WORKDIR           /home/github
RUN               curl -o actions-runner-linux-x64-2.324.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.324.0/actions-runner-linux-x64-2.324.0.tar.gz && tar xzf ./actions-runner-linux-x64-2.324.0.tar.gz
COPY              run.sh /
ENTRYPOINT        ["bash", "/run.sh"]