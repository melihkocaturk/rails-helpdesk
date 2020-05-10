class UserMailer < ApplicationMailer
  def new_ticket(ticket)
    @ticket = ticket
    mail(to: @ticket.email, subject: 'Your ticket has been created')
  end

  def new_comment(ticket, comment)
    @ticket = ticket
    @comment = comment
    mail(to: @ticket.email, subject: "New comment on ticket #{@ticket.title}")
  end
end
