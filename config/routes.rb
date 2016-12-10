Rails.application.routes.draw do
  resources :posts, only: [:index, :show]
  resources :pages, only: [:index, :show]
  resources :notes, only: [:index, :show]

  get '/', to: 'posts#index'
end
