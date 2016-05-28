Rails.application.routes.draw do
  devise_for :authors,
    path: 'auth',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { sessions: 'writers/sessions' }

  root to: "game_results#index"

  resources :games, only: [:index]
  resources :game_results, only: [:new, :create, :index]
  resources :result_likes, only: [:create]
end
