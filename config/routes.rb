# frozen_string_literal: true
Rails.application.routes.draw do
  get 'registrations/:token', to: 'registrations#new', as: :register_by_token
  post 'registrations', to: 'registrations#create'

  resources :invitations, only: [:index, :new, :create]

  devise_for :users
  root to: 'club#catty'
end
