FROM golang:1.18-alpine3.16 AS build
ENV CGO_ENABLED=0
WORKDIR /workspace
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN go build -o build/server .

FROM gcr.io/distroless/static:nonroot
WORKDIR /app
COPY --from=build /workspace/build/server /app/
CMD ["/app/server"]