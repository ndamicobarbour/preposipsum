Rails.application.routes.draw do
  resources :prepositions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'prepositions#index'
end
