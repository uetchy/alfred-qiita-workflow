package qiita

import (
	"fmt"
	"net/http"
)

type UsersService struct {
	client *Client
}

type User struct {
	Name              *string `json:"name"`
	Description       *string `json:"description"`
	FacebookId        *string `json:"facebook_id"`
	FolloweesCount    *int    `json:"followees_count"`
	FollowersCount    *int    `json:"followers_count"`
	GithubLoginName   *string `json:"github_login_name"`
	Id                *string `json:"id"`
	ItemsCount        *int    `json:"items_count"`
	LinkedInId        *string `json:"linkedin_id"`
	Location          *string `json:"location"`
	Organization      *string `json:"organization"`
	PermanentId       *int    `json:"permanent_id"`
	ProfileImageURL   *string `json:"profile_image_url"`
	TwitterScreenName *string `json:"twitter_screen_name"`
	WebsiteURL        *string `json:"website_url"`
}

type StocksOptions struct {
	ListOptions
}

func (s *UsersService) ListItems(opt *ListOptions) ([]Item, *http.Response, error) {
	u, err := addOptions("authenticated_user/items", opt)
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
		return nil, nil, err
	}

	return *items, resp, err
}

func (s *UsersService) ListStocks(userId string, opt *StocksOptions) ([]Item, *http.Response, error) {
	u := fmt.Sprintf("users/%s/stocks", userId)
	u, err := addOptions(u, opt)
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
		return nil, nil, err
	}

	return *items, resp, err
}
