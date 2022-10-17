Rails.application.routes.draw do


  devise_for :users
  root to: "homes#top"
  resources :books, only:[:new, :index, :show, :edit, :create ,:destroy,:update] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only:[:show,:edit,:index,:update,:destroy]

get '/home/about' => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
