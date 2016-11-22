Rails.application.routes.draw do
  get 'welcome/index'
  get 'main/index'
  resources :honeys

  root :to => 'welcome#index'

  scope "/:locale" do
    root :to => 'main#index'
    get "main/index"
    resources :honeys
  end
  get "de/main/index"
  get "en/main/index"
  get "hu/main/index"

  get '*path' => redirect('/')
end
