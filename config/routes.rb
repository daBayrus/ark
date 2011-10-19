Ark::Application.routes.draw do
  root :to => "projects#index"

  match "/auth/:provider/callback", :to => "authentications#create"

  resources :authentications, :only => [:index, :create, :destroy] do
    collection do
      get :login
      get :logout
      get :signup
    end
  end

  resources :projects do
    resources :pledges
  end

end
