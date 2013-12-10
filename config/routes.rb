BrownLumber::Application.routes.draw do
  devise_for :admins
  
	get 'about', to: 'static_pages#about'
	get 'location', to: 'static_pages#location'
	get 'contact', to: 'static_pages#contact'
	get 'product_help', to: 'static_pages#product_help'
	get 'contact', to: 'static_pages#contact'

	resources :main_categories
	resources :sub_categories
	resources :products

  root to: 'static_pages#home'
end
