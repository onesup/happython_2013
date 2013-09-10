Kfarm::Application.routes.draw do
  resources :users do
    
  end
  devise_for :users
  root :to => "home#index"
end
