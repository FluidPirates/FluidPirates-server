class API::GroupsController < API::APIController
  before_action :fetch_group, only: [:show, :update, :destroy]

  def show
    render json: @group.to_json(only: [:name, :description])
  end

  def create
    @group = Group.create(group_params)

    if @group.save
      render_success
    else
      render_error(@group.errors.full_messages.join(", ")
    end
  end

  def update
    if @group.update_attributes(group_params)
      render_success
    else
      render_error(@group.errors.full_messages.join(", ")
    end
  end

  def destroy
    @group.try(:destroy!)
    render_success
  end

  protected

  def fetch_group
    @group = Group.find_by!(slug: params[:slug])
  end

  def group_params
    params[:group].try(:permit, [:name, :description])
  end
end

