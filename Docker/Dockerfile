FROM ubuntu:18.04

WORKDIR /aws_cli

COPY . /aws_cli

RUN apt-get update \ 
    && apt-get install -y curl \
    && apt-get install -y  unzip

RUN curl -s "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && cd /aws_cli/aws/ \
    && ./install

ENTRYPOINT [ "sh", "/aws_cli/run.sh" ]

CMD [ "ls", "-l", "/usr/local/bin/aws" ]

