require_relative '../lib/qiita'

require 'dotenv'
Dotenv.load!

describe Qiita::API do
  describe "Qiita::API#setup called" do
    before do
      # Stub
      Qiita::API.should_receive(:auth).and_return({"url_name"=>"o_ame", "token"=>"836b54f92f3445c89352916d4c0c8bdd"})

      @response = Qiita::API.auth name: ENV['NAME'], password: ENV['PASS']
    end

    it 'Response should be Hash' do
      @response.class.should eq Hash
    end

    it 'Response has url_name and token keys' do
      @response.should have_key('url_name')
      @response.should have_key('token')
    end
  end

  describe "Qiita::API#search called" do
    before do
      @response = Qiita::API.search('rspec')
    end

    it 'Response should be Hash' do
      @response.class.should eq Array
    end

    describe 'First item of array' do
      let(:item) { @response.first }

      it 'Response has necessary keys' do
        item.keys.should include('id', 'url', 'title', 'stock_count', 'comment_count', 'created_at')
      end
    end
  end

  describe "Qiita::API#search called with stocks" do
    before do
      config = Qiita::Config.new
      @response = Qiita::API.search('rspec', token: config.token, stocked: 1)
    end

    it 'Response should be Hash' do
      @response.class.should eq Array
    end

    describe 'First item of array' do
      let(:item) { @response.first }

      it 'Response has necessary keys' do
        item.keys.should include('id', 'url', 'title', 'stock_count', 'comment_count', 'created_at')
      end
    end
  end
end