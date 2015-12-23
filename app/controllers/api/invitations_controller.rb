class API::InvitationsController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @invitations = @group.invitations
  end

  def accept
    @invitation = Invitation.find_by!(
      key: params[:invitation].try(:[], :key),
      email: current_user.email
    )
    @invitation.accept!(invited_user: current_user)
    render_success
  end

  def create
    @invitation = @group.invitations.create(invitation_params.merge(user: current_user))

    if @invitation.save
      InvitationMailer.invitation_email(@invitation).deliver_later
      render_success
    else
      render_error(@invitation.full_error_messages)
    end
  end


  def update
    if @invitation.update_attributes(invitation_params)
      render_success
    else
      render_error(@invitation.full_error_messages)
    end
  end

  def destroy
    @invitation.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])

    if params[:id]
      @invitation = @group.invitations.find_by!(id: params[:id])
    end
  end

  def invitation_params
    params[:invitation].try(:permit, [:email])
  end
end
