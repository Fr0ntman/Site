class NewsController < ApplicationController
  layout :resolve_layout

  def index
    @news = News.paginate(page: params[:page]).order(created_at: :desc).all
    @categories = NewsCategory.all

    respond_to do |format|
      format.js { render :index, layout: false}
      format.html { render :index }
    end
  end

  def show
    @news = News.find params[:id]
    @last_news = News.last 4
  end

  def category
    @news = News.where(category_id: params[:cat_id]).paginate(page: params[:page]).order(created_at: :desc).all
    @categories = NewsCategory.all
    respond_to do |format|
      format.js { render :index, layout: false}
      format.html { render :index }
    end
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
