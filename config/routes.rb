Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get 'backgrounds', to: 'backgrounds#show'
      get 'forecast', to: 'forecasts#show'
      post 'users', to: 'users#create'
      post 'sessions', to: 'sessions#create'
      post 'favorites', to: 'favorites#create'
      get 'favorites', to: 'favorites#index'
      delete 'favorites', to: 'favorites#delete'
      get 'gifs', to: 'gifs#show'
    end
  end
end
