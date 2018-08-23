Rails.application.routes.draw do
  resources :rejectedorders
  resources :full_orders
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_scope :user do
  authenticated :user do
  	resources :orders
    root 'orders#new', as: :authenticated_root
  end

  unauthenticated do
    root to: "devise/sessions#new"
  end
end
end