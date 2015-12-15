Rails.application.routes.draw do
  namespace "api", defaults: { format: :json }, constraints: { format: :json } do
    post "sessions" => "sessions#create"
    delete "sessions" => "sessions#destroy"

    get "users/current" => "users#current"
    resources :users

    resources :groups do
      resources :memberships

      resources :categories do
        resources "delegations"

        resources :polls do
          resources :propositions do
            resources :choices do
              get "votes/current" => "votes#current"
              resources :votes
            end
          end
        end
      end
    end
  end

  root "pages#home"
  get "*path" => "pages#not_found", format: "html"
end
