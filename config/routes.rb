Rails.application.routes.draw do

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:new, :create, :index, :edit, :show, :update, :destroy]
    resources :genres, only: [:create, :index, :edit,:update]
    resources :customers, only: [:create, :index, :edit,:update, :index, :show]
    resources :orders, only: [:show, :create, :update, :index]
    resources :order_details, only: [:update]

  end

  scope module: :public do
    root to: "homes#top"
    get "/about" => "homes#about"
    resources :items, only: [:index, :show]
    get "/customers" => "customers#show"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update"
    delete "cart_items/destroy_all" => "cart_items#destroy_all"
    get "/orders/thank" => "orders#thank"
    resources :customers, only: [:quit, :out]
    resources :delivery_addresses, only: [:index, :edit, :create, :update, :destroy]
    resources :cart_items, only: [:index, :edit, :create, :update, :destroy,]
    resources :orders, only: [:index, :new, :create, :show]
    post "/orders/confirm" => "orders#confirm"
    get "/customers/quit" => "customers#quit"
    patch "/customers/out" => "customers#out"


  end

 devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
