Rails.application.routes.draw do
  devise_for :users
  get 'welcome/index'
  get 'main/index'

  get 'honeys/set_ranks'

  resources :honeys do
    member do
      get 'rank_up'
      get 'rank_down'
    end
  end

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
