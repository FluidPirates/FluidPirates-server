Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json }, constraints: { format: :json } do
    scope 'sessions' do
      post '/' => 'sessions#create'
      delete '/current' => 'sessions#destroy'
    end

    post 'users' => 'users#create'

    get '/users/current' => 'users#current'
  end

  root 'pages#home'
  get '*path' => 'pages#not_found', format: 'html'
end
