require 'rails_helper'

RSpec.describe ErrorsController, type: :request do
  describe "GET#show" do
    it "renders corresponding page" do
      get '/unavailable/url'
      expect(response).to render_template('errors/404')
    end
  end
end
