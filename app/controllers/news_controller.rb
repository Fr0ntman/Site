class NewsController < ApplicationController
  layout :resolve_layout

  def index
    @news = News.order(created_at: :desc).all
  end

  def show
    @news = News.find params[:id]
    @last_news = News.last 4
  end

  private

    def resolve_layout
      case action_name
      when "show"
        "news"
      else
        "application"
      end
    end
end
