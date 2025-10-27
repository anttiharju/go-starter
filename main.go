package main

import (
	"context"
	"os"

	"github.com/anttiharju/go-starter/internal/buildinfo"
	"github.com/anttiharju/go-starter/internal/choose"
	"github.com/anttiharju/go-starter/internal/exitcode"
	"github.com/anttiharju/go-starter/internal/interrupt"
)

var (
	revision string
	version  string
	time     string
)

func main() {
	go interrupt.Listen(exitcode.Interrupt, os.Interrupt)

	ctx := context.Background()
	exitCode := choose.Wrapper(ctx, buildinfo.New(revision, version, time), os.Args[1:])
	os.Exit(exitCode)
}
