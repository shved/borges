Rails.application.routes.draw do
  devise_for :authors
  devise_for :authors,
    path: 'auth',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { sessions: 'writers/sessions' }

  root to: "game_results#index"

  resources :games
  resources :game_results
end
