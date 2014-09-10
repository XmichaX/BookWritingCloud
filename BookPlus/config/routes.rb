BookPlus::Application.routes.draw do

	# Startseite der Applikation
	root :to => 'welcome#index'

	mount Ckeditor::Engine => '/ckeditor'

	devise_for :users

	post "versions/:id/restore" => "versions#restore", :as => "restore_version"
	get "versions/:id/diff" => "versions#diff", :as => "diff_version"

	# Needless deep nesting

	# books
	resources :books do
		get 'export', :on => :member
		post 'close', :on => :member
		get 'new_edition', :on => :member
		resources :chapters, :except => [:index]
		resources :chunks, :except => [:index]
	end


# chapters
	resources :chapters, :except => [:index] do
		resources :chunks, :except => [:index]
	end


	# The priority is based upon order of creation:
	# first created -> highest priority.

	# Sample of regular route:
	#   match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

	# Sample of named route:
	#   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
	# This route can be invoked with purchase_url(:id => product.id)

	# Sample resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Sample resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Sample resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end

	# Sample resource route with more complex sub-resources
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', :on => :collection
	#     end
	#   end

	# Sample resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end

	# You can have the root of your site routed with "root"
	# just remember to delete public/diff.html.erb.
	# root :to => 'welcome#index'

	# See how all your routes lay out with "rake routes"

	# This is a legacy wild controller route that's not recommended for RESTful applications.
	# Note: This route will make all actions in every controller accessible via GET requests.
	# match ':controller(/:action(/:id))(.:format)'
end
