Rails.application.routes.draw do
  root to: 'public/homes#top'
  scope module: :public do
    get 'about' => 'homes#about'
    resources :items,             only: [:index, :show]
    resources :cart_items,        only: [:index, :create]
    resources :orders,            only: [:new, :create]
    post 'orders/confirm'     => 'orders#confirm'
    get  'orders/complete'    => 'orders#complete'
    resources :addresses,         only: [:index, :create]
    get  'customers/mypage'   => 'customers#show'
    get  'customers/inactive' => 'customers#inactive'
    patch 'customers/disable' => 'customers#disable'
    get  'customers/edit'     => 'customers#edit'
    patch 'customers'         => 'customers#update'
  end
  namespace :admin do
    root to: 'homes#top'
    resources :items,             only: [:index, :new, :create, :show, :edit, :update]
    resources :genres,            only: [:index, :create, :edit, :update]
    resources :customers,         only: [:index, :show, :edit, :update]
    resources :orders,            only: [:index, :show, :update]
    resources :order_details,     only: [:update]
  end
  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'publics/sessions',
    passwords:     'publics/passwords',
    registrations: 'publics/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
