Rails.application.routes.draw do
  devise_for :users

  scope module: :api do
    namespace :v1 do
      get 'index' => 'pages#index'
      resources :food_items
    end
  end
  root to: 'api/v1/pages#index'
end
