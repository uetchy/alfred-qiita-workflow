package main

import (
	"fmt"
	"github.com/codegangsta/cli"
	"github.com/spf13/viper"
)

func cmdSetup(c *cli.Context) {
	token := c.Args().First()

	loadConfig()
	viper.Set("accessToken", token)
	err := saveConfig()
	if err != nil {
		fmt.Println(err)
	}

	fmt.Println("Token saved")
}
