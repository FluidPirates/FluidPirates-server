Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json }, constraints: { format: :json } do
    post 'sessions' => 'sessions#create'
    delete 'sessions' => 'sessions#destroy'

    post 'users' => 'users#create'
    get 'users/current' => 'users#current'
  end

  root 'pages#home'
  get '*path' => 'pages#not_found', format: 'html'
end
