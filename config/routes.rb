Rails.application.routes.draw do
  root "projects#index"
  resources :projects do
    resources :votes
    resources :tasks
  end
end
