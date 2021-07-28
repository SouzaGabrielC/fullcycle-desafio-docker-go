FROM golang:1.16 AS build

WORKDIR /usr/app

COPY . .

RUN go build main.go

FROM scratch 

COPY --from=build /usr/app/main ./usr/app/

ENTRYPOINT [ "/usr/app/main" ]