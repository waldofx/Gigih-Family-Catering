Rails.application.routes.draw do
  # get 'foods/index'
  # get 'foods/show'
  # get 'foods/new'
  # get 'foods/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  resources :menuitems
  resources :categories
  resources :item_categories
  resources :customers
  resources :orders
  resources :orderdetails
  # Defines the root path route ("/")
  # root "articles#index"
end
