package main

import (
	"github.com/codegangsta/cli"
	"github.com/spf13/viper"
	"github.com/uetchy/go-qiita/qiita"
	"golang.org/x/oauth2"
	"os"
)

const (
	bundleID = "co.randompaper.alfred-qiita-workflow"
	version  = "2.0.0"
)

func newQiitaClient() (*qiita.Client, error) {
	loadConfig()
	var client *qiita.Client
	if accessToken := viper.GetString("accessToken"); accessToken != "" {
		ts := oauth2.StaticTokenSource(
			&oauth2.Token{AccessToken: accessToken},
		)
		tc := oauth2.NewClient(oauth2.NoContext, ts)
		client = qiita.NewClient(tc)
	} else {
		client = qiita.NewClient(nil)
	}

	return client, nil
}

func main() {
	app := cli.NewApp()
	app.Name = "alfred-qiita"
	app.Version = version
	app.Commands = []cli.Command{
		{
			Name:   "setup",
			Action: cmdSetup,
		},
		{
			Name:   "search",
			Action: cmdSearch,
		},
		{
			Name:   "stocks",
			Action: cmdStocks,
		},
		{
			Name:   "my",
			Action: cmdMy,
		},
	}
	app.Run(os.Args)
}
