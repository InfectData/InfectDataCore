Rails.application.routes.draw do

#_____________District________________________
  scope '/ga', module: :ga do
    resources :districts
  end
  resources :districts
#_____________Report___________________________
  scope '/ls', module: :ls do
    resources :reports
  end
  resources :reports
#_____________Diagnoses________________________
  scope '/rki', module: :rki do
    resources :diagnoses, only: :index do
      get 'cases', on: :member
    end
  end
  resources :diagnoses
#_____________Cases____________________________
  resources :cases do
    post 'confirm', on: :member
  end
#_____________Users____________________________
  scope '/admin', module: :admin do
    resources :users
  end
#______________________________________________
  devise_for :users
  root to: "content#homepage"

end
