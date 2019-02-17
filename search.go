package main

import (
	"fmt"
	"os"
	"strings"

	"github.com/codegangsta/cli"
	"github.com/pascalw/go-alfred"
	"github.com/uetchy/go-qiita/qiita"
)

func cmdSearch(c *cli.Context) {
	query := strings.Join(c.Args(), " ")
	client, err := newQiitaClient()
	if err != nil {
		fmt.Println(err)
		os.Exit(1)
	}

	items, _, _ := client.Items.List(&qiita.ItemsListOptions{Query: query})
	response := alfred.NewResponse()
	for _, item := range items {
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
