Rails.application.routes.draw do
  # namespace :admins_backoffice do
  #   get 'admins/index'
  #   get 'admins/edit/:id', to: 'admins#edit'
  # end
  namespace :site do
    get 'welcome/index'
    get 'search', to: 'search#questions'
    get 'subject/:subject_id/:subject', to: 'search#subject', as: 'search_subject'
    post 'answer', to: 'answer#question'
  end
  namespace :users_backoffice do
    get 'welcome/index'
    get 'profile', to: 'profile#edit'
  end
  namespace :admins_backoffice do
    get 'welcome/index' # dashboard
    # resources :admins, only: [:index, :edit, :update, :new, :create] # administradores
    # resources :admins, except: [:destroy] # administradores
    resources :admins # todas as rotas
    resources :subjects # assuntos/áreas
    resources :questions # perguntas
  end
  devise_for :users
  devise_for :admins, skip: [:registration]
  get 'inicio', to: 'site/welcome#index'
  root to: 'site/welcome#index' # para adicionar a primeira página no localhost:3000
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
