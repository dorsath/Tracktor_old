Tracker::Application.routes.draw do
  resources :users
  resources :projects do
    member do
      get  'add_user'
      put  'adds_user'
    end
    resources :features
  end
  root :to => 'projects#index'
end
