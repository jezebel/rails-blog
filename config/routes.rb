Rails.application.routes.draw do
  resources :posts, only: [:index, :show], constraints: { id: /\d{2}-[A-Za-z\-]+/ } do
    collection do
      get '/:year', action: :index, year: /\d{4}/, as: :year
      get '/:year/:month', action: :index, year: /\d{4}/, month: /\d{2}/, as: :year_month
    end
  end

  resources :pages, only: [:show], path: ''

  root to: 'posts#index'
end
