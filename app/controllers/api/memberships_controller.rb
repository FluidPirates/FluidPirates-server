class API::MembershipsController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @memberships = @group.memberships
  end

  def create
    @membership = @group.memberships.create(membership_params)

    if @membership.save
      render_success
    else
      render_error(@membership.full_error_messages)
    end
  end

  def update
    if @membership.update_attributes(membership_params)
      render_success
    else
      render_error(@membership.full_error_messages)
    end
  end

  def destroy
    @membership.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    
    if params[:id]
      @membership = @group.memberships.find_by!(id: params[:id])
    end
  end

  def membership_params
    params[:membership].try(:permit, [:user_id, :category_id, :role])
  end
end
