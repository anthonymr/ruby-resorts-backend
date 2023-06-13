Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :users, only: %i[create destroy]
      patch 'users', to: 'users#update'
      resources :rooms, only: %i[create destroy show index]
      resources :hotels, only: :index
      resources :reservations, only: %i[index show create destroy]


      post 'authentication', to: 'authentication#create'
      delete 'authentication', to: 'authentication#destroy'
      get 'authentication', to: 'authentication#show'
    end
  end
end
