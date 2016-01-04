class API::GroupsController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @groups = Group.with_includes
  end

  def current
    @groups = current_user.groups
    render "api/groups/index"
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      @group.add_admin(current_user)
      render_success
    else
      render_error(@group.full_error_messages)
    end
  end

  def update
    if @group.update_attributes(group_params)
      render_success
    else
      render_error(@group.full_error_messages)
    end
  end

  def destroy
    @group.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    if params[:id]
      @group = Group.with_includes.find_by!(id: params[:id])
    end
  end

  def group_params
    params[:group].try(:permit, [:name, :description, :domain]) || {}
  end
end
