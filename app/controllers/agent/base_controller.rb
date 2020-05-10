class Agent::BaseController < ApplicationController
  layout "agent"
  before_action :ensure_agent!
  before_action :query
  helper_method :status_count, :priority_count

  def status_count
    Ticket.where(agent_id: current_user.id).group(:status).count
  end

  def priority_count
    Ticket.where(agent_id: current_user.id).group(:priority).count
  end

  private

  def ensure_agent!
    raise "Unauthorized request" unless current_user && current_user.agent?
  end

  def query
    @q = Ticket.where(agent_id: current_user.id).ransack(params[:q])
  end
end
