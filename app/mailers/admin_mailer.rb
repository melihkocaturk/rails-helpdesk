class AdminMailer < ApplicationMailer
  def new_ticket(ticket)
    @ticket = ticket
    mail(to: "admin@helpdesk.com", subject: 'New ticket has been created')
  end
end
