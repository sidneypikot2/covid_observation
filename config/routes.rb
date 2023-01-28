require 'sidekiq/web'

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'

  resources :covid_observations,  path: '', only: [] do
    collection do
      post :upload, path: 'upload-covid-observation-data'
      get  :top_confirmed, path: '/top/confirmed'
    end
  end

end
