Rails.application.routes.draw do

  root 'pages#home'
  resources :articles, only: [:show, :index, :new, :create]

end
