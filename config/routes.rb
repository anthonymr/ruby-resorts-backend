Rails.application.routes.draw do
  scope 'api' do
    scope 'v1' do
      resources :users, only: %i[create update destroy show]

      post 'authentication', to: 'authentication#create'
      delete 'authentication', to: 'authentication#destroy'
    end
  end
end
