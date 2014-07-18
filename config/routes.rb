Rails.application.routes.draw do
  
  get 'invites/create'

  get 'leagues/:id/join' => 'leagues#join', as: :league_join
  resources :leagues

  resources :leagues do
    resources :movies
  end

  resources :invites
  devise_for :users

  # get "/" => 'alpha_landing#create', as: :alpha_email
  post "/" => 'alpha_landing#create', as: :alpha_email
  resources :alpha_landing

  get "/leagues/:league_id/movies/:id/edit" => 'movies#edit', as: :rotten_search
  patch "/leagues/:league_id/movies/:id/update" => 'movies#update', as: :update_movie_with_rt

  #get "/movies/my_roster" => 'movies#my_roster', as: :my_roster
  resources :movies, :collection => { :search => :get }
  
  resources :rotten_search


  # authenticated do
    root 'home#index', as: :authenticated
  # end

  # root :to => "alpha_landing#index"

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
