Rails.application.routes.draw do
  resources :news
  resources :courses do
    resources :lectures do
      resources :tasks
    end
    resources :exams
    collection do
      get 'specialities'
      get 'topics'
      get 'mit_courses'
      get '/speciality/:speciality_id' => :speciality, as: :speciality
    end 
  end

  get "/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'
end
