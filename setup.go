package main

import (
	"fmt"
	"os"

	"github.com/codegangsta/cli"
	"github.com/spf13/viper"
	"github.com/uetchy/go-qiita/qiita"
	"golang.org/x/oauth2"
)

func cmdSetup(c *cli.Context) {
	token := c.Args().First()

	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: token},
	)
	tc := oauth2.NewClient(oauth2.NoContext, ts)
	client := qiita.NewClient(tc)
	user, err := client.AuthenticatedUser.Show()
	if err != nil {
		fmt.Println("Auth failed")
		os.Exit(1)
	}

	loadConfig()
	viper.Set("accessToken", token)
	viper.Set("id", user.Id)

	err = saveConfig()
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	fmt.Println("Token saved")
}
