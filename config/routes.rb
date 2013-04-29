Amdb::Application.routes.draw do
  # Routes for the Movie resource:
  # CREATE
  get '/movies/new', controller: 'movies', action: 'new', as: 'new_movie'
  post '/movies', controller: 'movies', action: 'create'

  # READ
  get '/movies', controller: 'movies', action: 'index', as: 'movies'
  get '/movies/:id', controller: 'movies', action: 'show', as: 'movie'

  # UPDATE
  get '/movies/:id/edit', controller: 'movies', action: 'edit', as: 'edit_movie'
  put '/movies/:id', controller: 'movies', action: 'update'

  # DELETE
  delete '/movies/:id', controller: 'movies', action: 'destroy'
  #------------------------------

  # Routes for the Director resource:
  # CREATE
  get '/directors/new', controller: 'directors', action: 'new', as: 'new_director'
  post '/directors', controller: 'directors', action: 'create'

  # READ
  get '/directors', controller: 'directors', action: 'index', as: 'directors'
  get '/directors/:id', controller: 'directors', action: 'show', as: 'director'

  # UPDATE
  get '/directors/:id/edit', controller: 'directors', action: 'edit', as: 'edit_director'
  put '/directors/:id', controller: 'directors', action: 'update'

  # DELETE
  delete '/directors/:id', controller: 'directors', action: 'destroy'
  #------------------------------

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
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
