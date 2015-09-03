package qiita

import (
	// "fmt"
	"net/http"
	"time"
)

type ItemsService struct {
	client *Client
}

type Item struct {
	RenderedBody *string    `json:"rendered_body"`
	Body         *string    `json:"body"`
	Coediting    *bool      `json:"coediting"`
	CreatedAt    *time.Time `json:"created_at"`
	Id           *string    `json:"id"`
	Private      *bool      `json:"private"`
	Tags         []Tag      `json:"tags"`
	Title        *string    `json:"title"`
	UpdatedAt    *time.Time `json:"updated_at"`
	URL          *string    `json:"url"`
	// TODO: User
}

type Tag struct {
	Name     *string  `json:"name"`
	Versions []string `json:"versions"`
}

type ItemsListOptions struct {
	Query string `url:"query,omitempty"`
	ListOptions
}

func (s *ItemsService) List(opt *ItemsListOptions) ([]Item, *http.Response, error) {
	u, err := addOptions("items", opt)
	if err != nil {
		return nil, nil, err
	}
	req, err := s.client.NewRequest("GET", u, nil)
	if err != nil {
		return nil, nil, err
	}
	items := new([]Item)
	resp, err := s.client.Do(req, items)
	if err != nil {
		return nil, resp, err
	}

	return *items, resp, err
}
