Rails.application.routes.draw do
  resources :messages
  # User
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' },
                     path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }
  #   root 'profiles#index'
  root 'landing#show'

  # Landing
  get '/landing', to: 'landing#show'

  get 'users/profiles/:id', to: 'users#profile', as: 'profile'
  get 'users/delete/:id', to: 'users#delete', as: 'delete_user'
  get 'users/all', to: 'users#index'

  # Publications
  get '/publications', to: 'publications#index'
  get '/publications/no_reg', to: 'publications#no_reg'
  get '/publications/new', to: 'publications#new'
  post '/publications', to: 'publications#create'
  get '/publication/:id', to: 'publications#show', as: 'publication'
  get '/publications/:id/edit', to: 'publications#edit', as: 'edit_publication'
  patch '/publication/:id', to: 'publications#update'
  delete '/publication/:id', to: 'publications#delete'

  # Solicituds
  get '/solicituds', to: 'solicituds#index'
  get '/solicituds/chats', to: 'solicituds#chats'
  # get '/solicitud/:id/room', to: 'solicituds#room', as: 'room'
  get '/solicituds/:publication_id/new', to: 'solicituds#new', as: 'new_solicitud'
  post '/solicituds', to: 'solicituds#create'
  get '/solicitud/:id', to: 'solicituds#room', as: 'solicitud'
  get '/solicituds/:id/edit', to: 'solicituds#edit', as: 'edit_solicitud'
  patch '/solicitud/:id', to: 'solicituds#update'
  delete '/solicitud/:id', to: 'solicituds#delete', as: 'solicituds_delete'

  # Reviews
  get '/reviews', to: 'reviews#index'
  get 'reviews/:id', to: 'reviews#show'
  get '/reviews/:user_id/new', to: 'reviews#new', as: 'new_review'
  get '/reviews/:user_id/edit', to: 'reviews#edit', as: 'edit_review'
  post '/reviews/', to: 'reviews#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
