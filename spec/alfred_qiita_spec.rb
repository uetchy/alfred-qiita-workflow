# encoding: utf-8

require_relative '../lib/qiita'

describe Qiita::API do
  describe "Qiita::API#setup called" do
    before do
      @mock_user = 'john_doe'
      @mock_pass = 'spamspamspam'
      @expect_token = 'the_cake_is_a_lie'

      stub_request(:post, URI.join(Qiita::API::ENDPOINT, 'auth'))
        .with(:body => { :url_name => @mock_user, :password => @mock_pass })
        .to_return(:body => { :url_name => @mock_user, :token => @expect_token }.to_json ,:status => 200)

      @response = Qiita::API.auth @mock_user, @mock_pass
    end

    it 'Response should be Hash' do
      expect(@response.class).to eq Hash
    end

    it 'Response has url_name and token keys' do
      expect(@response).to have_key('url_name')
      expect(@response).to have_key('token')
      expect(@response['url_name']).to eq(@mock_user)
      expect(@response['token']).to eq(@expect_token)
    end
  end

  describe "Qiita::API#search called" do
    before do
      @search_word = 'Portal'

      stub_request(:get, URI.join(Qiita::API::ENDPOINT, 'search'))
        .with(:query => { :q => @search_word })
        .to_return(:body => [
          {
            :id => 1458,
            :uuid => "bbcca9f634028dc2f11c",
            :user => {
              :id => 1,
              :url_name => "o_ame",
              :profile_image_url => "https://example.com/avatar.png"
            },
            :title => "test",
            :created_at => "2011-12-26 19:41:26 +0900",
            :updated_at => "2012-03-16 11:30:27 +0900",
            :created_at_in_words => "2年以上",
            :updated_at_in_words => "2年以上",
            :tags => [
              {
                :name => "CoffeeScript",
                :url_name => "coffeescript",
                :icon_url => "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/e41b881d25c683db2ce913dba0d07b9695a55741/medium.jpg?1368788624",
                :versions => [ ]
              }
            ],
            :stock_count => 2,
            :comment_count => 0,
            :url => "http://qiita.com/mizchi/items/bbcca9f634028dc2f11c",
            :created_at_as_seconds => 1324896086,
            :tweet => false,
            :gist_url => nil,
            :private => false,
            :raw_body => "feafa",
            :body => "feafewafa",
            :stock_users => [
              "CLG",
              "mizchi"
            ]
          }
        ].to_json ,:status => 200)

      @response = Qiita::API.search(@search_word)
    end

    it 'Response should be Hash' do
      expect(@response.class).to eq Array
    end

    describe 'First item of array' do
      let(:item) { @response.first }

      it 'Response has necessary keys' do
        expect(item.keys).to include('id', 'url', 'title', 'stock_count', 'comment_count', 'created_at')
      end
    end
  end

  describe "Qiita::API#search called with stocks" do
    before do
      @search_word = 'Portal'
      @expected_token = 'the_cake_is_a_lie'

      stub_request(:get, URI.join(Qiita::API::ENDPOINT, 'search'))
        .with(:query => { :q => @search_word, :token => @expected_token, :stocked => 1 })
        .to_return(:body => [
          {
            :id => 1458,
            :uuid => "bbcca9f634028dc2f11c",
            :user => {
              :id => 1,
              :url_name => "o_ame",
              :profile_image_url => "https://example.com/avatar.png"
            },
            :title => "test",
            :created_at => "2011-12-26 19:41:26 +0900",
            :updated_at => "2012-03-16 11:30:27 +0900",
            :created_at_in_words => "2年以上",
            :updated_at_in_words => "2年以上",
            :tags => [
              {
                :name => "CoffeeScript",
                :url_name => "coffeescript",
                :icon_url => "https://s3-ap-northeast-1.amazonaws.com/qiita-tag-image/e41b881d25c683db2ce913dba0d07b9695a55741/medium.jpg?1368788624",
                :versions => [ ]
              }
            ],
            :stock_count => 2,
            :comment_count => 0,
            :url => "http://qiita.com/mizchi/items/bbcca9f634028dc2f11c",
            :created_at_as_seconds => 1324896086,
            :tweet => false,
            :gist_url => nil,
            :private => false,
            :raw_body => "feafa",
            :body => "feafewafa",
            :stock_users => [
              "CLG",
              "mizchi"
            ]
          }
        ].to_json ,:status => 200)

      @response = Qiita::API.search(@search_word, :token => @expected_token, :stocked => 1)
    end

    it 'Response should be Hash' do
      expect(@response.class).to eq Array
    end

    describe 'First item of array' do
      let(:item) { @response.first }

      it 'Response has necessary keys' do
        expect(item.keys).to include('id', 'url', 'title', 'stock_count', 'comment_count', 'created_at')
      end
    end
  end
end
