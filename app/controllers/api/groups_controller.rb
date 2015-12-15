class API::GroupsController < API::APIController
  before_action :fetch_group, only: [:show, :update, :destroy]

  def show
  end

  def index
    @groups = current_user.groups
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

  def fetch_group
    @group = Group.find_by!(id: params[:id] || params[:group_id])
  end

  def group_params
    params[:group].try(:permit, [:name, :description])
  end
end
