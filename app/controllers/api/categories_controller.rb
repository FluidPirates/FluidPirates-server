class API::CategoriesController < API::APIController
  before_action :fetch_group, only: [:index, :create]
  before_action :fetch_category, only: [:show, :update, :destroy]

  def show
    render json: @category.to_json(only: [:name, :description])
  end

  def index
    render json: @group.categories.to_json(only: [:name, :description])
  end

  def create
    @category = Category.create(category_params, group: @group)

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

  def fetch_group
    @group = Group.find_by!(id: params[:group_id])
  end

  def fetch_category
    @category = Category.find_by!(group_id: params[:group_id], id: params[:id])
  end

  def category_params
    params[:category].try(:permit, [:name, :description])
  end
end

