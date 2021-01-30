Rails.application.routes.draw do
  get 'sessions/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	root 'sessions#new'
	
	# get '/login', to: 'static_pages#login'
	get '/signup', to: 'users#new'
	get '/all', to: 'users#all'
	
	get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
	delete '/logout',  to: 'sessions#destroy'
	
	resources :users
end
