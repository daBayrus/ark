Ark::Application.routes.draw do
  match "/auth/:provider/callback", :to => "authentications#create"

  resources :authentications, only: [:index, :create, :destroy]
end
