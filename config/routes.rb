Rails.application.routes.draw do
  resources :states do
    resources :parks
  end
end
