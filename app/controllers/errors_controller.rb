class ErrorsController < ApplicationController
	include Gaffe::Errors
  layout 'error'

  def show
    render "errors/#{@status_code}", status: @status_code
  end
end
