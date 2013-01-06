RailsHero::Application.routes.draw do

  resources :videos


  devise_for :users

  root :to => 'dynamic_pages#home'

  devise_scope :user do
    get "/signin" => "devise/sessions#new"
    get "/signup" => "devise/registrations#new"
    get "/signout" => "devise/sessions#destroy"
  end
end
