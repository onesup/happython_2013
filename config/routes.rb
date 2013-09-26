Kfarm::Application.routes.draw do
  devise_for :users , controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :faq, :only => [:index]
  root :to => "home#index"
end
