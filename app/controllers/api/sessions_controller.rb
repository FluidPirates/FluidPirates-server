class API::SessionsController < API::APIController
  skip_before_action :verify_token, only: [:create]

  before_action :load_resources
  authorize_resource :token

  def create
    @user = User.find_by(email: params[:email])

    if @user.try(:authenticate, params[:password])
      render json: { token: Token.create_for_user(@user), message: "Logged in" }
    elsif !@user
      render_error("User not found")
    else
      render_error("Wrong password")
    end
  end

  def destroy
    current_token.try(:destroy!)
    render_success
  end

  protected

  def load_resources
    @token = current_token # For CanCanCan
  end
end
