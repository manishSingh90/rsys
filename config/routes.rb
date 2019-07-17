Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  get 'welcome/index'

  resources :menus do
    resources :items
  end

  get 'signup'  => 'users#new'
  resources :users

  get '/login' => 'sessions#new'
  post 'login' => 'sessions#create'

  delete 'logout' => 'sessions#destroy'


  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
