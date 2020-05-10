class Agent::TicketsController < Agent::BaseController
  def edit
    @ticket = Ticket.where(agent_id: current_user.id).includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def update
    @ticket = Ticket.find(params[:id])

    if @ticket.update(ticket_params)
      flash[:info] = "Ticket updated"
      redirect_to edit_agent_ticket_path(@ticket)
    else
      render 'edit'
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category_id, :status, :priority)
  end
end
