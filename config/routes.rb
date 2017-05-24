Rails.application.routes.draw do
  devise_for :users

  resources :tickets
  resource :search, only: %i[show create]

  namespace :admin do
    resources :trains do
      resources :carriages, shallow: true
    end

    resources :railway_stations do
      patch :update_position, on: :member
      patch :update_time, on: :member
    end

    resource :dashboard

    resources :tickets
    resources :routes
  end

  get 'welcome/index'
  root 'welcome#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
