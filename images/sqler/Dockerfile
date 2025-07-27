FROM golang:1.21

WORKDIR /app

RUN apt-get update && apt-get install -y sqlite3

COPY ./subtree/sqler sqler

RUN cd sqler && \
    go build -o sqler .

WORKDIR /app/sqler

CMD ["./sqler", "--help"]

