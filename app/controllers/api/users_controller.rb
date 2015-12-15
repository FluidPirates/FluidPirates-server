class API::UsersController < API::APIController
  skip_before_action :verify_token, only: [:create]

  def current
    if current_user
      render json: current_user.to_json(only: [:id, :name, :email])
    else
      render json: {}
    end
  end

  def index
    if params[:group_id]
      @users = Group.find_by!(id: params[:group_id]).users
    else
      @users = User.all
    end

    render json: @users.to_json(only: [:id, :name, :email])
  end

  def create
    @user = User.create(user_params)

    if @user.save
      render json: { token: Token.create_for_user(@user), message: "Signed in" }
    else
      render_error(@user.errors.full_messages.join(", "))
    end
  end

  protected

  def user_params
    params[:user].try(:permit, [:name, :email, :password])
  end
end
