Rails.application.routes.draw do
  resources :stocks, only: [:show]
  post 'stocks/search'

  root 'static_pages#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
