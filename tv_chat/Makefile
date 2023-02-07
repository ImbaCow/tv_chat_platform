BINARY_NAME=/usr/app/bin

build: main.go
	go mod download
	go build -o ${BINARY_NAME} ./

run:
	${BINARY_NAME}

br: build run

clean:
	go clean
	rm ${BINARY_NAME}