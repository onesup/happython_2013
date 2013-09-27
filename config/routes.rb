Kfarm::Application.routes.draw do
  
  devise_for :users , controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :faq, :only => [:index]
  resources :reviews, :only => [:index, :show]
  resources :notices, :only => [:index, :show]
  resources :answers, :only => [:index, :show]
  resources :questions
  match 'admin' => 'admin/dashboard#index', :via => :get, :as => "admin" 
  root :to => "home#index"
end
