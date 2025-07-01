Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    root "projects#index"
    resources :projects do
      resources :votes
      resources :tasks
    end
  end
end
