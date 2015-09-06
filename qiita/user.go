package qiita

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
