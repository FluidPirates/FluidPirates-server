Rails.application.routes.draw do
  namespace "api", defaults: { format: :json }, constraints: { format: :json } do
    post "sessions" => "sessions#create"
    delete "sessions" => "sessions#destroy"

    post "users" => "users#create"
    get "users/current" => "users#current"

    resources :groups do
      resources "users", only: [:index] do
        patch "membership" => "memberships#update"
        delete "membership" => "memberships#delete"
      end

      resources :categories do
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
