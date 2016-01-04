class API::ChoicesController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @choices = @category.choices
  end

  def create
    @choice = @proposition.choices.create(choice_params)

    if @choice.save
      render_success
    else
      render_error(@choice.full_error_messages)
    end
  end

  def update
    if @choice.update_attributes(choice_params)
      render_success
    else
      render_error(@choice.full_error_messages)
    end
  end

  def destroy
    @choice.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    @category = @group.categories.find_by!(id: params[:category_id])
    @poll = @category.polls.find_by!(id: params[:poll_id])
    @proposition = @poll.propositions.find_by!(id: params[:proposition_id])

    if params[:id]
      @choice = @proposition.choices.find_by!(id: params[:id])
    end
  end

  def choice_params
    params[:choice].try(:permit, [:name]) || {}
  end
end
