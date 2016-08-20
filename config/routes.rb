Rails.application.routes.draw do
  devise_for :authors,
    path: 'auth',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { registrations: 'author/registrations', sessions: 'author/sessions' }

  root to: "game_sessions#index"

  resources :games, only: [:index]
  resources :game_sessions, only: [:new, :create, :index] do
    get :start, on: :collection
  end
  resources :likes, only: [:create]

  namespace :api do
    get 'suggest' => 'theme_suggestions#suggest'
    resources :pending_game_sessions, only: :create
  end
end
