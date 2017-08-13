Rpgapp::Application.routes.draw do
  devise_for :users

  root "welcome/index"

  resource :users

  resources :char_types do
    resources :char_attributes
  end

  resources :char_combats
end
