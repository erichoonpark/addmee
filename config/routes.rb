Rails.application.routes.draw do
  resources :posts
  devise_for :users

  get 'welcome/about'

  root to: 'welcome#index'
end
