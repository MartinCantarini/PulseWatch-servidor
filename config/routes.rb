Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get 'mesures/create_mesure', to: 'mesures#create_mesure', as: :mesures_create_mesure
	get 'mesures/statics', to: 'mesures#statics', as: :mesures_statics
	root to: 'mesures#index'
 	
 	get 'users/login', to: 'users#login', as: :users_login
	get 'users/logup', to: 'users#logup', as: :users_logup
	resources :mesures 
end
