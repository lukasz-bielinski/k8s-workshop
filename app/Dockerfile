FROM golang:alpine as builder

COPY . $GOPATH/src/mypackage/myapp/
WORKDIR $GOPATH/src/mypackage/myapp/

RUN go get -d -v && CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /app

FROM scratch

COPY --from=builder /app /app

EXPOSE 8080
ENTRYPOINT ["/app"]
