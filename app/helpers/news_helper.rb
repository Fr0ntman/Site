module NewsHelper
	attr_reader :news, :cls

	def print_news(news, cls='content-col')
		@news = news
		content =<<TPL
			.#{cls}
				- news.each.with_index do |item, index|
					= news_el item if index.even?
			.#{cls}
				- news.each.with_index do |item, index|
					= news_el item if index.odd?
TPL

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