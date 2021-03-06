Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "sessions#new"

	get 'messages' => 'messages#index'
	post 'messages' => 'messages#create'
	get 'sessions' => 'sessions#new'
	post 'sessions' => 'sessions#create'
	put 'sessions' => 'sessions#delete'
	post 'passwords' => 'passwords#create'
	get 'passwords' => 'passwords#index'

	resources :chatrooms
    resources :messages

    mount ActionCable.server => '/cable' #enable websockets
end