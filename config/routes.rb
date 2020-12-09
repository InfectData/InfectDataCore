Rails.application.routes.draw do

  devise_for :users
  get '/' => 'content#homepage'
  root to: "content#homepage"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    scope '/admin', module: :admin do
    resources :users
    end
end
