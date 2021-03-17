Rails.application.routes.draw do

  root to:  'public/homes#top'
  get '/about' => 'public/homes#about'

  devise_for :admins, controllers: {
  sessions: 'admins/sessions'
  }

  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'public/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'public/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'public/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'public/registrations#new', as: 'new_user_registration'
    post 'users' => 'public/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'public/passwords#new', as: 'new_user_password'
  end

  scope module: :public do
  resources :customers, only: [:index]
  get 'items/:id' => 'users/items#show', as: 'item_user'
  resources :cart_items, only: [:index]
  resources :cart_items, only: [:create, :update, :destroy]

 end

  scope module: :admins do
  resources :items, only: [:index]
 end

end
