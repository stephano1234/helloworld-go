FROM golang:1.19 AS builder

WORKDIR /usr/src/helloworld

RUN go mod init helloworld

COPY . .

RUN go build -v -o helloworld .
RUN rm Dockerfile helloworld.go go.mod

FROM scratch

COPY --from=builder /usr/src/helloworld .

ENTRYPOINT [ "./helloworld" ]