Rails.application.routes.draw do
  root "pages#index"

  post '/auth/:provider/callback', to: 'sessions#create'
end
