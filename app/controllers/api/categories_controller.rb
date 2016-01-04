class API::CategoriesController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @categories = @group.categories
  end

  def create
    @category = @group.categories.create(category_params)

    if @category.save
      render_success
    else
      render_error(@category.full_error_messages)
    end
  end

  def update
    if @category.update_attributes(category_params)
      render_success
    else
      render_error(@category.full_error_messages)
    end
  end

  def destroy
    @category.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])

    if params[:id]
      @category = @group.categories.find_by!(id: params[:id])
    end
  end

  def category_params
    params[:category].try(:permit, [:name, :description]) || {}
  end
end
