Rails.application.routes.draw do

  resources :reports

  scope '/ga', module: :ga do
    resources :districts
  end

  scope '/ls', module: :ls do
    resources :reports
  end

  scope '/rki', module: :rki do
    resources :diagnoses, only: :index do
      get 'cases', on: :member
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
