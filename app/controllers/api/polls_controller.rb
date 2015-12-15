class API::PollsController < API::APIController
  before_action :fetch_resources

  def show
  end

  def index
    @polls = @group.polls
  end

  def create
    @poll = Poll.create(poll_params, group: @group, user: current_user)

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
    if params[:id]
      @poll = @group.polls.find_by!(id: params[:id])
    end
  end

  def poll_params
    params[:poll].try(:permit, [:name, :description])
  end
end
