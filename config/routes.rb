Rails.application.routes.draw do
  
  devise_for :admins
  get 'invites/create'

  get 'leagues/:id/join' => 'leagues#join', as: :league_join
  resources :leagues

  resources :leagues do
    resources :studios do
      resources :movies, only: [:index, :new, :create]
    end
  end

  resources :comments, only: [:show, :edit, :update, :destroy], :collection => { :search => :get }

  resources :invitesaccess
  devise_for :users

  devise_scope :user do
    get "/gologin" => "devise/sessions#new"
  end

  # get "/" => 'alpha_landing#create', as: :alpha_email
  post "/" => 'alpha_landing#create', as: :alpha_email
  resources :alpha_landing

  get "/leagues/:league_id/movies/:id/edit" => 'movies#edit', as: :rotten_search
  patch "/leagues/:league_id/movies/:id/update" => 'movies#update', as: :update_movie_with_rt

  #get "/movies/my_roster" => 'movies#my_roster', as: :my_roster
  
  resources :rotten_search

  resources :adminportal

  resources :home, :only => [:index]

  root :to => "alpha_landing#index"

end
