class AgentMailer < ApplicationMailer
  def assigned_ticket(ticket)
    @ticket = ticket
    mail(to: @ticket.agent.email, subject: 'You have been assigned a new ticket')
  end

  def new_comment(ticket, comment)
    @ticket = ticket
    @comment = comment
    mail(to: @ticket.agent.email, subject: "New comment on ticket #{@ticket.title}")
  end
end
