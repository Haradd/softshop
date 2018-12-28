Rails.application.routes.draw do
  resources :signups
  resources :mails
  resources :newsletters
  resources :orders_products
  resources :orders
  resources :wishlists_products
  resources :products
  resources :product_types
  resources :publishers
  resources :wishlists
  resources :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
