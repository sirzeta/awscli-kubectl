FROM atlassian/default-image:2

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \ 
    python get-pip.py && \
    rm get-pip.py

RUN pip install awscli

RUN curl -o /usr/local/bin/aws-iam-authenticator https://amazon-eks.s3-us-west-2.amazonaws.com/1.12.7/2019-03-27/bin/linux/amd64/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator

RUN curl -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

RUN curl -s https://api.github.com/repos/kubernetes-sigs/kustomize/releases/latest | grep browser_download | grep linux | cut -d '"' -f 4 | xargs curl -O -L && \
    mv kustomize_*_linux_amd64 /usr/local/bin/kustomize && \
    chmod u+x /usr/local/bin/kustomize