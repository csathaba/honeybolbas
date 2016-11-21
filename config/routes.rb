Rails.application.routes.draw do
  get 'welcome/index'
  resources :honeys

  scope "(:locale)", locale: /en|de|hu/ do
    root :to => 'welcome#index'
    get "welcome/index"
    resources :honeys
  end

  root "welcome#index"

  get '*path' => redirect('/')
end
