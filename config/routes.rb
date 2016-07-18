Rails.application.routes.draw do
  namespace :admin do
    resources :news, except: :show
  end

  resources :news, only: [:show, :index]
  resources :courses do
  	resources :lectures
  	resources :exams
  	resources :tasks
  end

  get "/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'
end
