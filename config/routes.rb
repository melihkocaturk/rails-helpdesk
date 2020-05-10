Rails.application.routes.draw do
  get 'comments/create'
  namespace :admin do
    get 'dashboard/index'
  end
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users

  get 'welcome/index'
  root 'welcome#index'

  get 'tickets/thanks'
  resources :tickets, only: [:show, :new, :create] do
    resources :comments, only: [:create]
  end

  namespace :agent do
    get '/', to: 'dashboard#index'
    resources :tickets, only: [:edit, :update] do
      resources :comments, only: [:create]
    end
  end

  namespace :admin do
    get '/', to: 'dashboard#index'
    resources :tickets
  end
end
