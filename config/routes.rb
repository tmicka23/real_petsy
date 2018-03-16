Rails.application.routes.draw do


  resources :posts do
  	collection do
  		get 'me'
  	end
  end

  devise_for :users, controllers: {
  	omniauth_callbacks: 'users/omniauth_callbacks' ,
    registrations: 'users/registrations'
  }

  resources :pets
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "home#index"

end
