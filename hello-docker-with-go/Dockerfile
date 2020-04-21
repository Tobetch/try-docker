# Designation a base of Docker image
FROM golang:1.9

# Commands that is executed when build
## Both of them works on Docker container.
RUN mkdir /echo
COPY main.go /echo

# Commands that is executed when 
## This means "$ go run /echo/main.go"
CMD ["go", "run", "/echo/main.go"]
