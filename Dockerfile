FROM golang:1.21
WORKDIR /src
COPY <<EOF ./main.go
package main

import "time"

func main() {
	for {
		time.Sleep(time.Second)
	}
}
EOF

RUN go build -o /bin/pause ./main.go
FROM scratch
COPY --from=0 /bin/pause /bin/pause
CMD ["/bin/pause"]
