Rails.application.routes.draw do
  root to: "sessions#index"
  # get '/admin', to: 'users#admin', as: :admin_panel
  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"
  get "/friendships/:id/confirm", to: "friendships#confirm", as: "confirm_friendship"
   get "/friendships/:id/deny", to: "friendships#deny", as: "deny_friendship"

  resources :users
  resources :messages
  resources :friendships
  resources :document_accesses
  resources :documents
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
