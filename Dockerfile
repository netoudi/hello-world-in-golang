FROM golang:1.13-alpine as builder

#### COPY ####
WORKDIR /go/src/app
COPY . .

#### BUILD ###
RUN go build App.go

#### OPTIMIZE ####
FROM golang:1.13-alpine
WORKDIR /go/src/app
COPY --from=builder /go/src/app/App .
ENTRYPOINT ./App
