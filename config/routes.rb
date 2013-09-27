Kfarm::Application.routes.draw do
  devise_for :users , controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  namespace :admin do
    resources :answers
    resources :jobs
    resources :notices
    resources :questions
    resources :reviews
    resources :users
  end
  resources :faq, :only => [:index]
  resources :reviews, :only => [:index, :show]
  resources :notices, :only => [:index, :show]
  resources :answers, :only => [:index, :show]
  resources :questions
  match 'admin' => 'admin/dashboard#index', :via => :get, :as => "admin" 
  root :to => "home#index"
end
