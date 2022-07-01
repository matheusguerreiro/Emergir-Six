Rails.application.routes.draw do
  # namespace :admins_backoffice do
  #   get 'admins/index'
  #   get 'admins/edit/:id', to: 'admins#edit'
  # end
  namespace :site do
    get 'welcome/index'
  end
  namespace :users_backoffice do
    get 'welcome/index'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # dashboard
    resources :admins, only: [:index, :edit] # administradores
  end
  devise_for :users
  devise_for :admins
  get 'inicio', to: 'site/welcome#index'
  root to: 'site/welcome#index' # para adicionar a primeira página no localhost:3000
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
