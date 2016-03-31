class NewsController < ApplicationController
	before_action  :news_item, only: [:show, :edit, :update]

	def index
		@news = News.find_each
	end

	def show
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new news_params
		begin
			redirect_to news_path @news if @news.save
		rescue
			flash.now[:error] = "Ошибка сервера, попробуйте добавить новость позднее или обратитесь к администратору"
			render :new
		end
	end

	def edit
	end

	def update
		begin
			if @news.update_attributes news_params
				redirect_to news_path @news
			end
		rescue
			flash.now[:error] = "Ошибка сервера, попробуйте изменить новость позднее или обратитесь к администратору"
			render :edit
		end
	end

	def destroy
		vk = vk_init
		@item = News.find params[:id]
		if @item.destroy
			vk.wall.delete owner_id: ENV['vk_group_id'], post_id: @item.vk_post_id
			redirect_to root_path
		end
	end

	private

		def news_params
			params.require(:news).permit(:title, :content)			
		end

		def news_item
			@news = News.find params[:id]
		end
end
