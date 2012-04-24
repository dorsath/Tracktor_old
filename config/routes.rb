Tracker::Application.routes.draw do
  resources :users
  resources :projects do
    member do
      get  'users'
      get  'add_user'
      put  'adds_user'
      match  'removes_user/:user_id', :action => 'removes_user_from', :via => :put, :as => :removes_user_from
    end
    resources :features
  end
  root :to => 'projects#index'
end
