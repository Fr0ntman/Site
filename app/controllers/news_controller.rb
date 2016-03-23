class NewsController < ApplicationController
	def index
		@news = News.find_each
	end

	def show
		@news = News.find(params[:id])
	end

	def new
		@news = News.new
	end

	def create
		@news = News.new(news_params)
		if @news.save
			redirect_to :root
		else
			redirect_to :new
		end
	end

	def edit		
	end

	def update		
	end

	def destroy		
	end

	private

		def news_params
			params.require(:news).permit(:title, :content)			
		end
end
