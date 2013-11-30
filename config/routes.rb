BrownLumber::Application.routes.draw do
	get 'about',    to: 'static_pages#about'
	get 'location', to: 'static_pages#location'

  root to: 'static_pages#home'
end
