BrownLumber::Application.routes.draw do
  devise_for :admins
  
	get 'about',    to: 'static_pages#about'
	get 'location', to: 'static_pages#location'

	resources :main_categories
	resources :sub_categories
	resources :products

  root to: 'static_pages#home'
end
