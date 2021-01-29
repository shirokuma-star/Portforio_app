Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  	root 'static_pages#login'
  	
  	get '/login', to: 'static_pages#login'
  	get '/signup', to: 'users#new'
  	post '/signup', to: 'users#create'
  	get '/all', to: 'users#all'
  	
  	resources :users
end
