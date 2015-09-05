package main

import (
	"github.com/codegangsta/cli"
	"os"
)

const (
	bundleId = "co.randompaper.alfred-qiita-workflow"
)

func main() {
	app := cli.NewApp()
	app.Name = "qiita"
	// app.Usage = "fight the loneliness!"
	app.Commands = []cli.Command{
		{
			Name:   "search",
			Action: cmdSearch,
		},
		{
			Name:   "setup",
			Action: cmdSetup,
		},
	}
	app.Run(os.Args)
}
