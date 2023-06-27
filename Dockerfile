FROM golang:latest AS build-env
WORKDIR /app
COPY * ./
RUN go mod download
# COPY * ./
# COPY templates/ ./templates/
RUN CGO_ENABLED=0 GOOS=linux go build -o hackaton

FROM alpine:latest
RUN apk update && apk add ca-certificates && rm -rf /var/cache/apk/*
WORKDIR /app
# COPY templates/ ./templates/
COPY --from=build-env /app/hackaton /app/hackaton
EXPOSE 8080
CMD ["/app/hackaton"]
