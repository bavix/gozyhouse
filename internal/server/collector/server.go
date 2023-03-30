//go:generate protoc -I ../../../api/ --go_out=. --go-grpc_out=. ../../../api/collector.proto
package collector

import (
	"context"

	"google.golang.org/grpc"
	"google.golang.org/protobuf/types/known/emptypb"
)

type Collector struct {
	addr   string
	server *grpc.Server

	UnsafeCollectorServer
}

func NewGrpcServer() *Collector {
	return &Collector{}
}

func (c *Collector) PushEvents(_ context.Context, _ *Events) (*emptypb.Empty, error) {
	return nil, nil
}

func (c *Collector) Validator(_ context.Context, _ *Event) (*ValidationResult, error) {
	return nil, nil
}
