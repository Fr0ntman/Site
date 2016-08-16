Rails.application.routes.draw do
  namespace :admin do
    resources :news, except: :show do
      patch 'publicate', on: :collection
    end
  end

  resources :news, only: [:show, :index]
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
      post 'sub_categories'
      post 'specialities_list'
      post 'courses_list'
    end 
  end

  get "/*id" => 'pages#show', as: :page, format: false
  root to: 'pages#show', id: 'home'
end
