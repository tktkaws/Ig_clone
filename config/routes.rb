Rails.application.routes.draw do
  root 'pictures#index'
  resources :users do
    member do
      get "show_favorites" => "users#show_favorites"
    end
  end
  resources :sessions
  resources :favorites
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
