Rails.application.routes.draw do

  root 'pages#home'
  get "about", to: "pages#about"
  get "articles", to: "articles#index"
  resources :articles, only: [:show]

end
