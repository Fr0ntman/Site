class PagesController < ApplicationController
	include HighVoltage::StaticPage

	layout :layout_for_page

	private

		def layout_for_page
			case params[:id]
			when 'home'
				'home'
			when 'about'
				'about'
			else
				'application'
			end
		end
end
