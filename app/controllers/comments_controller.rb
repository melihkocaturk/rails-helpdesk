class CommentsController < ApplicationController
  before_action :get_ticket

  def create
    comment = @ticket.comments.build(comment_params)
    comment.user = current_user
    comment.save

    AgentMailer.new_comment(@ticket, comment).deliver_later

    redirect_to ticket_path(@ticket)
  end

  private

  def get_ticket
    @ticket = Ticket.find(params[:ticket_id])
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
