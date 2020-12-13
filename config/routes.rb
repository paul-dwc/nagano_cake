Rails.application.routes.draw do
  namespace :admin do
    root to: 'homes#top'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
