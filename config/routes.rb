Rails.application.routes.draw do
  get 'reservations/index'
  get 'rooms/index'
  get 'users/profile'
  get 'users/account'
  
  devise_for :users, controllers: {
   sessions: 'users/sessions',
   registrations: 'users/registrations'
 }
  root to: 'home#top'

  devise_scope :user do
    get 'profile/edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile/update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  resources :rooms do
    collection do
      get 'search'
      get 'own'
    end
  end

  resources :reservations do
    collection do
      post 'confirm'
    end
  end
  
end
