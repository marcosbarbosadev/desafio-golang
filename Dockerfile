FROM golang:1.20.4 AS buildgo

WORKDIR /go

COPY full-cycle.go .

RUN go build full-cycle.go

FROM scratch

WORKDIR /go

COPY --from=buildgo /go/full-cycle .

ENTRYPOINT [ "./full-cycle" ]