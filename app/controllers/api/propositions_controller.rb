class API::PropositionsController < API::APIController
  before_action :fetch_resources

  def show
  end

  def index
    @propositions = @poll.propositions
  end

  def create
    @proposition = Proposition.create(proposition_params, poll: @poll)

    if @proposition.save
      render_success
    else
      render_error(@proposition.full_error_messages)
    end
  end

  def update
    if @proposition.update_attributes(proposition_params)
      render_success
    else
      render_error(@proposition.full_error_messages)
    end
  end

  def destroy
    @proposition.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    @poll = @group.polls.find_by!(id: params[:poll_id])
    if params[:id]
      @proposition = @poll.propositions.find_by!(id: params[:id])
    end
  end

  def proposition_params
    params[:proposition].try(:permit, [:name, :description])
  end
end
