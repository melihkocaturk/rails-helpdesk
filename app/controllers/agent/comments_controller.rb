class Agent::CommentsController < Agent::BaseController
  before_action :get_ticket

  def create
    comment = @ticket.comments.build(comment_params)
    comment.user = current_user
    comment.save

    UserMailer.new_comment(@ticket, comment).deliver_later

    flash[:info] = "New comment created"
    redirect_to edit_agent_ticket_path(@ticket)
  end

  private

  def get_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
