Rails.application.routes.draw do
  resources :contacts
  resources :lists
  resources :templates
  resources :campaigns do 
    member do 
      patch :publish
    end
  end
  devise_for :users, controllers: { registrations: 'registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "home#index"

end
