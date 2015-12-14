Rails.application.routes.draw do
  namespace 'api', defaults: { format: :json }, constraints: { format: :json } do
    scope 'sessions' do
      post '/' => 'sessions#create'
      delete '/current' => 'sessions#destroy'
    end

    post 'users' => 'users#create'

    scope 'current_user' do
      get '/' => 'users#current'
    end
  end

  root 'pages#home'
  get '*path' => 'pages#not_found', format: 'html'
end
