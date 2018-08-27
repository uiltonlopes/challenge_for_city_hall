Rails.application.routes.draw do
  root 'welcome#index'
  resources :teams
  resources :members

  # resources :meetings
  get 'meetings/:id' => "meetings#index", as: "meetings"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
