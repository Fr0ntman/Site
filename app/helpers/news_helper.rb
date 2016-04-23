module NewsHelper
	attr_accessor :news

	def print_news(news)
		@news = news
		content =<<EOS
			.content-col
				- news.each.with_index do |item, index|
					= news_el item if index.even?
			.content-col
				- news.each.with_index do |item, index|
					= news_el item if index.odd?
EOS

		Slim::Template.new { content }.render self
	end

	private

		def news_el(news)
			if news.attachments.empty?
				render 'news_el_without_img', item: news
			else
				render 'news_el_with_img', item: news
			end
		end
end