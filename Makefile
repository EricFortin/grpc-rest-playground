all: swagger-spec swagger-ui open-browser

swagger-ui: swagger-spec
	@if [ -z $$(docker ps -q -f "name=swaggerui") ]; then\
		echo "Swagger ui not running. Starting...";\
		docker run -d --name swaggerui -v "${PWD}/swaggerspec:/usr/share/nginx/html/swaggerspec" -e API_URL=http://localhost:8080/swaggerspec/service.swagger.json -p 8080:8080 swaggerapi/swagger-ui:v3.8.1;\
	fi
	
swagger-spec:
	protoc -I/usr/local/include -I. \
  		-I${GOPATH}/src \
  		-I${GOPATH}/src/github.com/grpc-ecosystem/grpc-gateway/third_party/googleapis \
  		--swagger_out=logtostderr=true:./swaggerspec/ \
  		service.proto

open-browser: swagger-ui
	google-chrome http://localhost:8080

clean:
	docker stop swaggerui
	docker rm swaggerui