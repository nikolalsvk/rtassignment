Rails.application.routes.draw do
  devise_for :users

  root 'welcome#index'

  resource :users

  resources :char_types do
    resources :char_attributes
  end

  resources :char_combats

  resource :render_async, :only => :show do
    member { get :render_me }
  end
end
