Rails.application.routes.draw do

  resources :authors, only: [:show, :index] do
    resources :posts, only: [:show, :index, :new, :edit]
  end

  resources :posts, only: [:index, :show, :new, :create, :edit, :update]

  get '/admin/comments/moderate', to: 'comments#moderate'

  scope '/admin', module: 'admin' do
    resources :stats, only: [:index]
    resources :authors, only: [:new, :delete, :create]
  end

  root 'posts#index'
end
