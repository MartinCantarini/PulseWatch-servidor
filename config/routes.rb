Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get 'mesures/create_mesure', to: 'mesures#create_mesure', as: :mesures_create_mesure
	get 'mesures/last_mesures', to: 'mesures#last_mesures', as: :mesures_last_mesures
	root to: 'mesures#index'
 	
 	get 'users/login', to: 'users#login', as: :users_login
	get 'users/logup', to: 'users#logup', as: :users_logup
	resources :mesures 
end
