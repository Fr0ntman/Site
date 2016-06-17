require "rails_helper"

RSpec.describe NewsController, :type => :controller do
  let(:news) { create_list(:new_post, 5) }
  
  describe "GET #index" do
    before(:each) do
      get :index
    end
    
    it "responds successfully with an HTTP 200 status code" do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      expect(response).to render_template("index")
    end

    it "loads all of the news into @news" do
      expect(assigns(:news)).to match_array(news)
    end
  end
  
  describe "GET #show" do
    before(:each) do
      get :show, id: news.first.id
    end
    
    it "takes four last news" do
      last_news_count = 4
      expect(assigns(:last_news)).to match_array(news.last(last_news_count))
    end
    
    it "takes requested news" do
      expect(assigns(:news)).to eq(news.first)
    end
  end
end
