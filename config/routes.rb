Rails.application.routes.draw do
  namespace "api", defaults: { format: :json }, constraints: { format: :json } do
    post "sessions" => "sessions#create"
    delete "sessions" => "sessions#destroy"

    post "users" => "users#create"
    get "users/current" => "users#current"

    resources :groups do
      get "users" => "groups#users"

      resources :categories do
        get "polls" => "polls#index"

        resources "delegations"
      end

      resources :polls do
        resources :propositions do
          resources :choices do
            resources :votes
          end
        end
      end
    end
  end

  root "pages#home"
  get "*path" => "pages#not_found", format: "html"
end
