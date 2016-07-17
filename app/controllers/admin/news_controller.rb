class Admin::NewsController < Admin::ApplicationController

  before_action :load_news_item, only: [:edit, :update, :show, :destroy, :publish]

  def index
    @news = News.order(created_at: :desc)
  end

  def new
    @news_item = News.new
  end

  def create
    @news_item = News.new news_params

    if @news_item.save
      redirect_to admin_news_path(@news_item)
    else
      render :new
    end
  end

  def edit; end

  def update
    if @news_item.update_attributes news_params
      redirect_to admin_news_path(@news_item)
    else
      render :edit
    end
  end

  def destroy
    @news_item.destroy

    redirect_to admin_news_index_path
  end

private

  def news_params
    params.require(:news).permit(:title, :source, :category_id, :content, :description, :published, {attachments: []})
  end

  def load_news_item
    @news_item = News.find params[:id]
  end

end
