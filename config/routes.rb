Rails.application.routes.draw do

  # get '/admin', to: 'users#admin', as: :admin_panel
  get "/sessions/new", to: "sessions#new", as: "new_session"
  post "/sessions", to: "sessions#create", as: "sessions"
  delete "/sessions", to: "sessions#destroy"

  resources :users
  resources :messages
  resources :friendships
  resources :document_accesses
  resources :documents
 

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
