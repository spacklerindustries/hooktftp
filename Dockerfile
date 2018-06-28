FROM arm32v7/golang as builder

COPY . /go/src/github.com/tftp-go-team/hooktftp
WORKDIR /go/src/github.com/tftp-go-team/hooktftp/src

RUN go get -d -v ./...
RUN go build -o hooktftp *.go

FROM arm32v7/ubuntu

WORKDIR /root/
COPY --from=builder /go/src/github.com/tftp-go-team/hooktftp/src/hooktftp /root/hooktftp

EXPOSE 69/tcp 69/udp
VOLUME /etc/hooktftp

CMD /root/hooktftp -v /etc/hooktftp/hooktftp.yml
