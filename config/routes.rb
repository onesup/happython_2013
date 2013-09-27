Kfarm::Application.routes.draw do
  
  get "reviews/index"
  get "reviews/show"
  get "reviews/edit"
  get "reviews/new"
  get "notices/index"
  get "notices/show"
  get "notices/edit"
  get "notices/new"
  get "questions/index"
  get "questions/show"
  get "questions/edit"
  get "questions/new"
  get "answers/index"
  get "answers/show"
  get "answers/edit"
  get "answers/new"
  get "jobs/index"
  get "jobs/show"
  get "jobs/edit"
  get "jobs/new"
  get "users/index"
  get "users/show"
  get "users/edit"
  get "users/new"
  devise_for :users , controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :faq, :only => [:index]
  resources :reviews, :only => [:index, :show]
  resources :notices, :only => [:index, :show]
  resources :answers, :only => [:index, :show]
  resources :questions
  match 'admin' => 'admin/dashboard#index', :via => :get, :as => "admin" 
  root :to => "home#index"
end
