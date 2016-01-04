class API::PollsController < API::APIController
  before_action :fetch_resources
  authorize_resource

  def show
  end

  def index
    @polls = @category.polls
  end

  def create
    @poll = @category.polls.create(poll_params.merge(user: current_user))

    if @poll.save
      render_success
    else
      render_error(@poll.full_error_messages)
    end
  end

  def update
    if @poll.update_attributes(poll_params)
      render_success
    else
      render_error(@poll.full_error_messages)
    end
  end

  def destroy
    @poll.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    @category = @group.categories.find_by!(id: params[:category_id])

    if params[:id]
      @poll = @category.polls.find_by!(id: params[:id])
    end
  end

  def poll_params
    params[:poll].try(:permit, [:name, :description, :open_at, :close_at]) || {}
  end
end
