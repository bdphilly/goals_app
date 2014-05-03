NewAuthDemo::Application.routes.draw do
  resources :goals
  resources :users, :only => [:create, :new, :show]
  resource :session, :only => [:create, :destroy, :new]
  resources :comments
  root :to => "users#show"
end
