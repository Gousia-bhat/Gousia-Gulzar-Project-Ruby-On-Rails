Rails.application.routes.draw do
  get 'photos/new'
  get 'photos/show'
  get 'photos/edit'
  get 'photos/update'
  get 'home/index'
  devise_for :users
  root to: 'home#index'
  resources :users do
    resources :albums do
    	resources :photos
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
