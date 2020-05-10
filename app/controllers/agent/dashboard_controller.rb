class Agent::DashboardController < Agent::BaseController
  def index
    @tickets = @q.result(distinct: true).order(id: :desc).page params[:page]
  end
end
