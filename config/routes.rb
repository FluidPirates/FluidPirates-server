Rails.application.routes.draw do
  namespace "api", defaults: { format: :json }, constraints: { format: :json } do
    post "sessions" => "sessions#create"
    delete "sessions" => "sessions#destroy"

    get "users/current" => "users#current"
    resources :users, only: [:index, :show, :create, :update, :destroy]

    get "groups/current" => "groups#current"
    resources :groups, only: [:index, :show, :create, :update, :destroy] do
      post "invitations/accept" => "invitations#accept"
      resources :invitations, only: [:index, :show, :create, :update, :destroy]
      resources :memberships, only: [:index, :show, :create, :update, :destroy]

      resources :categories, only: [:index, :show, :create, :update, :destroy] do
        resources :delegations, only: [:index, :show, :create, :update, :destroy]

        resources :polls, only: [:index, :show, :create, :update, :destroy] do
          resources :propositions, only: [:index, :show, :create, :update, :destroy] do
            resources :choices, only: [:index, :show, :create, :update, :destroy] do
              get "votes/current" => "votes#current"
              resources :votes, only: [:index, :show, :create, :update, :destroy]
            end
          end
        end
      end
    end
  end

  root "pages#home"
  get "*path" => "pages#not_found", format: :html
end
