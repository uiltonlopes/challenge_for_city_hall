Rails.application.routes.draw do
  root 'welcome#index'
  resources :teams
  resources :members

  get 'meeting_mornings/:id' => "meeting_mornings#index", as: "meeting_mornings"
  get 'meeting_mornings/:id/new' => "meeting_mornings#new", as: "new_meeting_mornings"
  post 'meeting_mornings/:id' => "meeting_mornings#create"

  get 'meeting_afternoons/:id' => "meeting_afternoons#index", as: "meeting_afternoons"
  get 'meeting_afternoons/:id/new' => "meeting_afternoons#new", as: "new_meeting_afternoons"
  post 'meeting_afternoons/:id' => "meeting_afternoons#create"

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
