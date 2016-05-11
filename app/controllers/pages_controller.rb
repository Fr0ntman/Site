class PagesController < ApplicationController
	include HighVoltage::StaticPage

	layout :layout_for_page

	private

		def layout_for_page
			case params[:id]
			when 'home'
				'home'
			when 'team_admins', 'team_translators'
				'team'
			else
				'application'
			end
		end
end
