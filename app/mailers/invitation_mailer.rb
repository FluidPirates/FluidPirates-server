class InvitationMailer < ApplicationMailer
  def invitation_email(invitation)
    @user = invitation.user
    @email = invitation.email
    @group = invitation.group
    @url = api_group_invitations_url(invitation)
    mail(to: @email, subject: "You are invited to join #{@group.name} on FluidPirates")
  end
end
