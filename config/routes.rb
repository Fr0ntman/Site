Rails.application.routes.draw do
  resources :news
  resources :courses do
  	resources :lectures
  	resources :exams
  	resources :tasks
  end

  get "/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'

  # error pages
  %w( 404 422 500 503 ).each do |code|
    get code, :to => "errors#show", :code => code
  end
end
