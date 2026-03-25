.PHONY: generate proto openapi lint clean

generate: proto openapi

proto:
	buf generate

openapi:
	oapi-codegen -generate types,server,spec -package cardsv1 \
		-o gen/openapi/cards/v1/cards.gen.go openapi/v1/cards.yaml
	oapi-codegen -generate types,server,spec -package collectionv1 \
		-o gen/openapi/collection/v1/collection.gen.go openapi/v1/collection.yaml
	oapi-codegen -generate types,server,spec -package usersv1 \
		-o gen/openapi/users/v1/users.gen.go openapi/v1/users.yaml

lint:
	buf lint

clean:
	rm -rf gen/proto gen/openapi
