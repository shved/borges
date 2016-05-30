Rails.application.routes.draw do
  devise_for :authors,
    path: 'auth',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { sessions: 'writers/sessions' }

  root to: "game_sessions#index"

  resources :games, only: [:index]
  resources :game_sessions, only: [:new, :create, :index]
  resources :likes, only: [:create]
end
