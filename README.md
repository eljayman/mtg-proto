# mtg-proto

Contract definitions for the MTG collection platform.
OpenAPI specs for external REST interfaces, Protobuf for internal gRPC.
Generated code is committed — consuming services need no codegen toolchain.

## Structure

- `openapi/v1/` — REST contracts consumed by the API gateway and frontend
- `proto/*/v1/` — gRPC contracts for internal service communication
- `gen/` — generated Go code, committed, do not edit by hand

## Versioning

This repo uses semantic versioning. Services pin a specific tag in go.mod.
Adding optional fields is non-breaking. Removing or renaming fields requires a minor bump until v1.0.0.

## Regenerating (maintainer only)

Requires: `buf` CLI, `oapi-codegen`
```bash
make generate
make tidy
```

Commit the resulting changes in `gen/`.

## Consuming in a service
```go
import (
    cardsv1     "github.com/yourusername/mtg-proto/gen/proto/cards/v1"
    oapicards   "github.com/yourusername/mtg-proto/gen/openapi/cards/v1"
)
```