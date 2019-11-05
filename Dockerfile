FROM golang:1.13-alpine as builder

#### COPY ####
WORKDIR /go/src/app
COPY . .

#### BUILD ###
RUN go get -d -v
RUN GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o /go/bin/app

#### OPTIMIZE ####
FROM scratch
COPY --from=builder /go/bin/app /go/bin/app
ENTRYPOINT ["/go/bin/app"]
