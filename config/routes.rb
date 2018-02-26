Rails.application.routes.draw do

  get 'bulk_insert_texts/index'

  resources :push_texts
  resources :registrants
  devise_for :user, only: :none
  devise_scope :user do
    get :sign_in, controller: 'users/sessions', action: :new
  end
  resource :user, only: :none do
    ## ログインページ
    devise_scope :user do
      resource :session, only: [:create, :destroy], module: :users
    end
  end

  resource :bulk_insert_texts, only: [:index] do
    post :bulk_create
  end

  ## トップページ
  root to: 'registrants#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
