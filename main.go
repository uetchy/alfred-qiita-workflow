package main

import (
	"github.com/codegangsta/cli"
	"os"
)

const (
	bundleId    = "co.randompaper.alfred-qiita-workflow"
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
	}
	app.Run(os.Args)
}

func cmdSetToken(c *cli.Context) {
	token := c.Args().First()

	configPath := "~/Library/Application Support/Alfred 2/Workflow Data/" + bundleId + "/token"

	fout, err := os.Create(configPath)
	if err != nil {
		return
	}
	defer fout.Close()

	fout.WriteString(token)
}
