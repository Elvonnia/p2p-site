Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root "sessions#new"

    mount ActionCable.server => '/cable' #enable websockets
end

get 'messages' => 'messages#index'
post 'messages' => 'messages#create'