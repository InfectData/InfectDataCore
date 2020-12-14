Rails.application.routes.draw do

  resources :cases
  devise_for :users

  root to: "content#homepage"

  scope '/admin', module: :admin do
    resources :users
  end

end
