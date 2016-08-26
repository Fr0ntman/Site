class PagesController < ApplicationController
	include HighVoltage::StaticPage

	layout :layout_for_page

	private

		def layout_for_page
			case params[:id]
			when 'home'
				'home'
			when 'exam'
				'course'
			when 'about/project', 'about/team', 'about/wanna-help', 'about/partners'
				'about'
			else
				'application'
			end
		end
end
