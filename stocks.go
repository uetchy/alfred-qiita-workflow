package main

import (
	"github.com/codegangsta/cli"
	"github.com/pascalw/go-alfred"
	"github.com/spf13/viper"
)

func cmdStocks(c *cli.Context) {
	query := c.Args()
	client, err := newQiitaClient()
	if err != nil {
		return
	}

	items, _, err := client.Users.Stocks(viper.GetString("id"), nil)
	if err != nil {
		errRes := alfred.NewResponse()
		errRes.AddItem(&alfred.AlfredResponseItem{
			Valid:    true,
			Title:    "Failed to authorize",
			Subtitle: "Press 'qiita setup' to setup your personal token",
		})
		errRes.Print()
		return
	}

	alfred.InitTerms(query)
	response := alfred.NewResponse()
	for _, item := range items {
		if !alfred.MatchesTerms(query, item.Title+item.Body) {
			continue
		}
		response.AddItem(&alfred.AlfredResponseItem{
			Valid:    true,
			Uid:      item.Id,
			Title:    item.Title,
			Arg:      item.URL,
			Subtitle: item.User.Id + " " + item.CreatedAt.Format("2006/01/02 15:04:05"),
		})
	}

	response.Print()
}
