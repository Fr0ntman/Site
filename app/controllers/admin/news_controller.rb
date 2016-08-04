class Admin::NewsController < Admin::ApplicationController
  rescue_from VkontakteApi::Error, with: :vk_error_handler
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
      flash.now[:errors] = @news_item.errors if @news_item.errors.any?
      render :new
    end
  end

  def edit; end

  def update
    if @news_item.update_attributes news_params
      redirect_to admin_news_index_path
    else
      flash.now[:errors] = @news_item.errors if @news_item.errors.any?
      render :edit
    end
  end

  def destroy
    if params[:ids] 
      News.delete(params[:ids])
    else
      @news_item.destroy
    end

    redirect_to admin_news_index_path
  end

  def publicate
    respond_to do |format|
      unless params[:news_ids].blank?
        @news = News.where id: params[:news_ids]
        @news.update_all(published: true)
        
        format.html { redirect_to admin_news_index_path }
        format.json { render json: {status: 'ok', message: 'Success!'} }
      else
        format.json { render json: {status: 'error', message: 'Fail!'} }
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
      params.require(:news).permit(:title, :source, :category_id, :content, :description, :published, {attachments: []}, :remove_attachments)
    end

    def load_news_item
      @news_item = News.find params[:id]
    end

end
