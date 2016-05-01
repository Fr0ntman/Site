Rails.application.routes.draw do
  resources :news
  resources :courses
  root 'news#index'
end
