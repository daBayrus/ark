Ark::Application.routes.draw do
  match "/auth/:provider/callback", :to => "authentications#create"
end
