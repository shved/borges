Rails.application.routes.draw do
  devise_for :writers,
    path: 'auth',
    path_names: { sign_in: 'login', sign_out: 'logout' },
    controllers: { sessions: 'writers/sessions' }

  root to: "games#index"
end
