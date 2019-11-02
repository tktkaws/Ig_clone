Rails.application.routes.draw do
  root 'top#index'
  resources :users
  resources :sessions
  resources :favorites
  resources :pictures do
    collection do
      post :confirm
    end
  end
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
