class NewsController < ApplicationController
  before_action :news_item, only: [:show, :edit, :update, :destroy]
  rescue_from VkontakteApi::Error, with: :vk_error_handler

  def index
    @news = News.order(created_at: :desc).all
  end

  def show
    @last_news = News.last 4
  end

  def new
    @news = News.new
  end

  def create
    @news = News.new news_params
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format| 
      if @news.update_attributes news_params
        format.html { redirect_to @news }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @count = News.find_each.count
    respond_to do |format|
      if @news.destroy
        format.js
      else
        format.json { render json: @news.errors, status: :internal_server_error }
      end
    end
  end

  private

    def vk_error_handler
      respond_to do |format|
        format.html { render :new } 
        flash.now[:error] = "Произошла ошибка при обращении к API вконтакте"
      end
    end

    def news_params
      params.require(:news).permit(:title, :content, :description, attachments: [])
    end

    def news_item
      @news = News.find params[:id]
    end
end
