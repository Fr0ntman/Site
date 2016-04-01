class NewsController < ApplicationController
	before_action  :news_item, only: [:show, :edit, :update, :destroy]

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
			redirect_to @news if @news.save
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
				redirect_to @news
			end
		rescue
			flash.now[:error] = "Ошибка сервера, попробуйте изменить новость позднее или обратитесь к администратору"
			render :edit
		end
	end

	def destroy
		@count = News.find_each.count
		@error = false
		respond_to do |format|
			begin
				format.js if @news.destroy
			rescue
				@error = true
				format.js
			end
		end
	end

	private

		def news_params
			params.require(:news).permit(:title, :content, {attachments: []})			
		end

		def news_item
			@news = News.find params[:id]
		end
end
