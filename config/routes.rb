Boxroom::Application.routes.draw do
  match '/signin',  :to => 'sessions#new'
  match '/signout', :to => 'sessions#destroy'
  match '/folders/:id/new', :to => 'folders#new'

  # Resources
  resources :admins, :only => [:new, :create]
  resources :sessions, :only => [:new, :create, :destroy]
  resources :reset_password, :except => [:index, :show, :destroy]
  resources :users, :except => :show
  resources :groups, :except => :show
  resources :files, :except => [:index, :new, :create]

  # Update a collection of permissions
  resources :permissions, :only => :update_multiple do
    collection do
      put :update_multiple
    end
  end

  # Nested resources
  resources :folders, :shallow => true, :except => [:new, :create] do
    resources :folders, :only => [:new, :create]
    resources :files, :only => [:new, :create]
  end

  root :to => "folders#index"
end
