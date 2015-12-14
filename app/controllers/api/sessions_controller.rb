class API::SessionsController < API::APIController
  skip_before_action :verify_token

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
end
