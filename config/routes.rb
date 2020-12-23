Rails.application.routes.draw do

  resources :rkis do
    collection do
      get 'all_cases'
    end 
  end

  resources :districts
  resources :diagnoses

  resources :cases do
    post 'confirm', on: :member
  end

  devise_for :users

  root to: "content#homepage"

  scope '/admin', module: :admin do
    resources :users
  end

end
