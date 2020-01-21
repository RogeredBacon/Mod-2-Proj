Rails.application.routes.draw do
  resources :messages
  resources :friendships
  resources :document_accesses
  resources :documents
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
