package main

import (
	"github.com/codegangsta/cli"
	"github.com/spf13/viper"
	"github.com/uetchy/alfred-qiita-workflow/qiita"
	"golang.org/x/oauth2"
	"os"
)

const (
	bundleId = "co.randompaper.alfred-qiita-workflow"
	version  = "2.0.0"
)

func newQiitaClient() (*qiita.Client, error) {
	err := loadConfig()
	if err != nil {
		return nil, err
	}
	accessToken := viper.GetString("accessToken")
	if accessToken == "" {
		return nil, err
	}
	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: accessToken},
	)
	tc := oauth2.NewClient(oauth2.NoContext, ts)
	client := qiita.NewClient(tc)
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
