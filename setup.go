package main

import (
	"github.com/codegangsta/cli"
	"github.com/spf13/viper"
)

func cmdSetup(c *cli.Context) {
	token := c.Args().First()

	loadConfig()
	viper.Set("accessToken", token)
	saveConfig()
}
