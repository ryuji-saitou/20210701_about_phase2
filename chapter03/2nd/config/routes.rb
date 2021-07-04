Rails.application.routes.draw do
  devise_for :users
  resources :users,only: [:show,:index,:edit,:update]
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy] do
    #idが不要なため "resources(複数)" ではなく "resource(単数)" となる
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root 'homes#top'
  get 'home/about' => 'homes#about'
end