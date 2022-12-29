FROM golang:1.19 AS builder

WORKDIR /usr/src/fullcycle-rocks

RUN go mod init full-cycle-rocks

COPY . .

RUN go build -v -o fullcycle-rocks .
RUN rm Dockerfile fullcycle-rocks.go go.mod

FROM scratch

COPY --from=builder /usr/src/fullcycle-rocks .

ENTRYPOINT [ "./fullcycle-rocks" ]