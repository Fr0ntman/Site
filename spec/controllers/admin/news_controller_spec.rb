require 'rails_helper'

RSpec.describe Admin::NewsController, :type => :controller do

  describe "GET #index" do
    let(:news1) { FactoryGirl.create(:news) }
    let(:news2) { FactoryGirl.create(:news) }

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the news into @news" do
      get :index

      expect(assigns(:news)).to match_array([news1, news2])
    end
  end

  describe "GET #show" do
    let(:news) { FactoryGirl.create(:news) }

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: news.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :show, id: news.id
      expect(response).to render_template("show")
    end

    it "loads the news into @news_item" do
      get :show, id: news.id

      expect(assigns(:news_item)).to eq(news)
    end
  end

  describe "GET #edit" do
    let(:news) { FactoryGirl.create(:news) }

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: news.id
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "renders the show template" do
      get :edit, id: news.id
      expect(response).to render_template("edit")
    end

    it "loads the news into @news_item" do
      get :edit, id: news.id

      expect(assigns(:news_item)).to eq(news)
    end
  end

  describe "PUT #update" do
    let(:news) { FactoryGirl.create(:news) }

    it "responds successfully with an HTTP 200 status code" do
      put :update, id: news.id, news: { title: 'new_title' }

      expect(response).to have_http_status(302)
    end

    it "updates the news" do
      put :update, id: news.id, news: { title: 'new_title' }
      news.reload
      expect(news.title).to eq('new_title')
    end
  end
end
