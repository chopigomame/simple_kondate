Rails.application.routes.draw do
  get "/login", to: 'sessions#new'
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "top", to: "top#top"
  post "menu", to: "menu#show"
  root "top#top"
  
  resources :add_menu, only: [:new, :create]
end
