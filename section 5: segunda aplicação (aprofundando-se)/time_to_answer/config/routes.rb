Rails.application.routes.draw do
  devise_for :profiles
  devise_for :admins
  get 'welcome/index'
  get 'inicio', to: 'welcome#index'
  root to: 'welcome#index' # para adicionar a primeira página no localhost:3000
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
