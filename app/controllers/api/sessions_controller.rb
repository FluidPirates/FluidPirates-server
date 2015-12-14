class API::SessionsController < API::APIController
  def create
    @user = User.find_by(email: params[:email])

    if !@user
      render_error("User not found")
    elsif @user.try(:authenticate, params[:password])
      set_current_user(@user)
      render_success
    else
      render_error("Wrong password")
    end
  end
end
