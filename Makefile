.PHONY: generate generate-proto generate-openapi tidy lint

OAPI_CODEGEN := go run github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@v2.3.0

generate: generate-proto generate-openapi

generate-proto:
	buf generate

generate-openapi:
	$(OAPI_CODEGEN) -config openapi/v1/oapi-codegen.cards.yaml    openapi/v1/cards.yaml
	$(OAPI_CODEGEN) -config openapi/v1/oapi-codegen.collection.yaml openapi/v1/collection.yaml
	$(OAPI_CODEGEN) -config openapi/v1/oapi-codegen.users.yaml    openapi/v1/users.yaml

lint:
	buf lint

tidy:
	go mod tidy