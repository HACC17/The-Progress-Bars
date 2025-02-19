Rails.application.routes.draw do
	root :to => 'grants#index'
  	resources :grants, :only => [:index] do
		collection { post :import }
		#collection { delete :kill }
	end
	
	#redirect to root for unknown
	get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
