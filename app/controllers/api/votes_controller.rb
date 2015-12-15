class API::VotesController < API::APIController
  before_action :fetch_resources

  def show
  end

  def index
    @votes = @category.votes
  end

  def create
    @vote = @choice.votes.create(user: current_user)

    if @vote.save
      render_success
    else
      render_error(@vote.full_error_messages)
    end
  end

  def destroy
    @vote.try(:destroy!)
    render_success
  end

  protected

  def fetch_resources
    @group = Group.find_by!(id: params[:group_id])
    @category = @group.categories.find_by!(id: params[:category_id])
    @poll = @category.polls.find_by!(id: params[:poll_id])
    @proposition = @poll.propositions.find_by!(id: params[:proposition_id])
    @choice = @proposition.choices.find_by!(id: params[:choice_id])

    if params[:id]
      @vote = @choice.votes.find_by!(id: params[:id])
    end
  end
end
