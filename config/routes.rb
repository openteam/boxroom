Boxroom::Application.routes.draw do
  devise_for :users

  match '/folders/:id/new', :to => 'folders#new'

  # Resources
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
