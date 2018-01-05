## Background

I wanted to start using grpc in my next project but I also wanted to provide a rest API for convenience. However, I still wanted to provide a beautiful API in rest. In order to speed up the evaluation of the quality of the API generated from `proto` file, I created this small project.

## Installation

You need to install [protobuf](https://github.com/google/protobuf) to use the `protoc` compiler.

You need grpc-gateway pluggin for swagger generation with `protoc`:

```sh
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
go get -u github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
```

Finally, you need [docker](https://www.docker.com/) to run swagger ui from a container. It is possible to run without but it it way simpler and who doesn't run docker these days.

## Usage

Place your protobuf definition in `service.proto` and `make` it. It will launch swagger ui, generate the open api spec and finally launch a browser pointed at swagger ui.

After first launch, `make` will only re-generate the spec and launch the browser.