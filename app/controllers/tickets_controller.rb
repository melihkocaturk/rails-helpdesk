class TicketsController < ApplicationController
  def show
    @ticket = current_user.tickets.includes(:comments).find(params[:id])
    @comment = Comment.new
  end

  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.user = current_user

    if @ticket.save
      AdminMailer.new_ticket(@ticket).deliver_later
      UserMailer.new_ticket(@ticket).deliver_later
      redirect_to tickets_thanks_path
    else
      render 'new'
    end
  end

  def thanks
  end

  private

  def ticket_params
    params.require(:ticket).permit(:category_id, :name, :email, :title, :message, attachments: [])
  end
end
