Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "top", to: "top#top"
  post "menu", to: "menu#show"
  
  resources :add_menu, only: [:new, :create]
end
