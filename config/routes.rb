Rails.application.routes.draw do
  resources :news
  resources :courses do
  	resources :lectures
  	resources :exams
  	resources :tasks
  end
  root to: 'high_voltage/pages#show', id: 'home'
end
