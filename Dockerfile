FROM arm32v7/golang

COPY . /go/src/github.com/tftp-go-team/hooktftp
WORKDIR /go/src/github.com/tftp-go-team/hooktftp

RUN make

EXPOSE 69/tcp 69/udp

VOLUME /etc/hooktftp

CMD ./src/hooktftp -v /etc/hooktftp/hooktftp.yml
