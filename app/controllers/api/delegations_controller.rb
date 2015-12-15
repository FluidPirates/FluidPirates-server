class API::DelegationsController < API::APIController
  before_action :fetch_resources

  def show
  end

  def index
    @delegations = @category.delegations
  end

  def create
    @delegation = current_user.delegations.create({category: @category}.merge(delegation_params))

    if @delegation.save
      render_success
    else
      render_error(@delegation.full_error_messages)
    end
  end

  def update
    if @delegation.update_attributes(delegation_params)
      render_success
    else
      render_error(@delegation.full_error_messages)
    end
  end

  def destroy
    @delegation.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    @category = @group.categories.find_by!(id: params[:category_id])
    if params[:id]
      @delegation = @category.delegations.find_by!(id: params[:id])
    end
  end

  def delegation_params
    params[:delegation].try(:permit, [:delegate_id])
  end
end
