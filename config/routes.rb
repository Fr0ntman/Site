Rails.application.routes.draw do
  namespace :admin do
    resources :news
  end

  resources :news
  resources :courses do
  	resources :lectures
  	resources :exams
  	resources :tasks
  end

  get "/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'
end
