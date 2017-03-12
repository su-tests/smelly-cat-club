# frozen_string_literal: true
Rails.application.routes.draw do
  resources :invitations, only: [:index, :new, :create]
  resources :registrations, only: [:new, :create]

  devise_for :users
  root to: 'club#catty'
end
