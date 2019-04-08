FROM golang:1.12-alpine as builder
WORKDIR /go/src/github.com/nozaq/example-docker-multistage-go
COPY . .
RUN go build -o myapp .

FROM alpine:latest
WORKDIR /root/
COPY --from=builder /go/src/github.com/nozaq/example-docker-multistage-go/myapp .
CMD ["./myapp"]

