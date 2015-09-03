package main

import (
	"github.com/pascalw/go-alfred"
	"fmt"
	"github.com/codegangsta/cli"
	"github.com/uetchy/alfred-qiita-workflow/qiita"
	"golang.org/x/oauth2"
)

func cmdSearch(c *cli.Context) {
	query := c.Args().First()

	ts := oauth2.StaticTokenSource(
		&oauth2.Token{AccessToken: accessToken},
	)
	tc := oauth2.NewClient(oauth2.NoContext, ts)
	client := qiita.NewClient(tc)

	// Fetch items
	items, _, _ := client.Items.List(&qiita.ItemsListOptions{Query: query})
	fmt.Println(*items[0].Title)

	// alfred.InitTerms(query)

	response := alfred.NewResponse()

	for _, item := range items {
		// if !alfred.MatchesTerms(query, repo.Name) {
		// 	continue
		// }
		response.AddItem(&alfred.AlfredResponseItem{
			Valid: true,
			Uid:   *item.Id,
			Title: *item.Title,
			Arg:   *item.URL,
		})
	}

	response.Print()
}
