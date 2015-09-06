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
