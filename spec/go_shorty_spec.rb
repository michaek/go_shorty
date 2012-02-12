require 'spec_helper'

describe 'Go Shorty' do
  def app
    @app ||= GoShorty::Application
  end
  
  context "Creation" do
    it "should show the home page" do
      get '/'
      last_response.should be_ok
    end
  end
  
  context "Redirection" do
    before(:each) do
      @long_url = 'http://example-long-url.com'
      @short_url = mock(ShortUrl)
      @short_url.stub!(:url).and_return(@long_url)
    end
    
    it "redirects when given a valid short url" do
      ShortUrl.should_receive(:find_by_key).with('4ER').and_return(@short_url)
      get '/4ER'
      last_response.should be_redirect
      last_response["Location"].should == 'http://example-long-url.com'
    end

    it "displays 404 page when short url is invalid" do
      ShortUrl.should_receive(:find_by_key).with('invalid').and_return(nil)
      get '/invalid'
      last_response.status.should == 404
    end
  
    it "displays 404 page when short url doesn't exist" do
      ShortUrl.should_receive(:find_by_key).with('A2Ph').and_return(nil)
      get '/A2Ph'
      last_response.status.should == 404
    end
  end
end
