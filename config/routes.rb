Rails.application.routes.draw do
  root to: 'static_pages#root'

  namespace :api,  defaults: {format: :json} do
    resources :users, only: [:create]
    resource :session, only: [:create, :destroy]
    resources :servers, only: [:show, :index, :create, :update, :destroy] do
      member do
        post 'join'
        delete 'leave'
      end
    end
  end
end
