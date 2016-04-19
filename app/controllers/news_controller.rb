class NewsController < ApplicationController
	before_action  :news_item, only: [:show, :edit, :update, :destroy]

	def index
		@news = News.order(created_at: :desc).all
		@news_init = News.new
	end

	def show
	end

	def new
		render file: 'public/404'
	end

	def create
		@news = News.new news_params
		respond_to do |format|
			if @news.save
				format.js
			else
				format.json { render json: @news.errors, status: :unprocessable_entity }
			end
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
		respond_to do |format|
			if @news.destroy
				format.js
			else
				format.json { render json: @news.errors, status: :internal_server_error }
			end
		end
	end

	private

		def news_params
			params.require(:news).permit(:title, :content, :description, {attachments: []})			
		end

		def news_item
			@news = News.find params[:id]
		end
end
