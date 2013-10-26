Kfarm::Application.routes.draw do
  get "collection_books/index"
  match 'guide' => "home/guide", :via => :get
  get "faq/index"
  get "home/guide"
  
  resources :books do
    collection do
      get 'search/:q', to: 'books#search'
      get '/:q', to: 'books#index'
    end
    resources :users do
      member do
        post 'collection'
      end
    end
  end
  
  
  resources :jobs do
  end

  resources :users do
    member do
      get 'current_works'
    end
    collection do
      post 'join'
    end
    resources :collection_books, :only => [:index]
  end

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
    
  namespace :admin do
    resources :answers
    resources :jobs
    resources :notices
    resources :questions
    resources :reviews
    resources :users
    resources :banners
  end
  
  resources :faq, :only => [:index]
  resources :reviews, :only => [:index, :show, :new, :create]
  resources :notices, :only => [:index, :show]
  resources :answers, :only => [:index, :show]
  resources :questions
  match 'admin' => 'admin/dashboard#index', :via => :get, :as => "admin" 
  root :to => "home#index"
end