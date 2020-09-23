FROM golang:1-alpine AS builder
MAINTAINER Michalski Luc <michalski.luc@gmail.com>

ARG VERSION
ARG GIT_COMMIT
ARG BUILD_DATE

# NB. CGO enabled for sqlite3 driver
ARG CGO=0
ENV CGO_ENABLED=${CGO}
ENV GOOS=linux
ENV GO111MODULE=on

WORKDIR /go/src/github.com/paper2code/diagrams2ai

COPY . /go/src/github.com/paper2code/diagrams2ai

RUN apk update && \
    apk add --no-cache git ca-certificates

RUN go build -ldflags "-extldflags=-static -extldflags=-lm" -o /go/bin/diagrams2ai

FROM alpine:3.12

RUN apk add --no-cache ca-certificates

COPY --from=builder /go/bin/diagrams2ai /usr/bin/diagrams2ai

WORKDIR /opt/diagrams2ai

ENTRYPOINT ["diagrams2ai"]
