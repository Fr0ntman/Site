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
		@news = News.new(news_params)
		if @news.save
			redirect_to news_path @news
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @news.update_attributes(news_params)
			redirect_to news_path @news
		else
			render :edit
		end
	end

	def destroy
		News.find(params[:id]).destroy
		redirect_to root_path
	end

	private

		def news_params
			params.require(:news).permit(:title, :content)			
		end

		def news_item
			@news = News.find(params[:id])
		end
end
