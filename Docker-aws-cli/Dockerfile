FROM alpine

RUN apk update \ 
    && apk add --update --no-cache curl py-pip 

RUN pip3 install awscli

CMD [ "--version" ]

ENTRYPOINT ["aws"]
