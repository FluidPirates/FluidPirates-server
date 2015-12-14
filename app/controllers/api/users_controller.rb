class API::UsersController < API::APIController
  def current
    if current_user
      render json: current_user.to_json(only: [:id, :name, :email])
    else
      render json: {}
    end
  end
end
