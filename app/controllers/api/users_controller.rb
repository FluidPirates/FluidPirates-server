class API::UsersController < API::APIController
  skip_before_action :verify_token, only: [:create]
  load_and_authorize_resource

  def show
  end

  def current
    @user = current_user
    render "api/users/show"
  end

  def index
    @users = User.all
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
