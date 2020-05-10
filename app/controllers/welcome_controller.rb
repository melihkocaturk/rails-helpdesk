class WelcomeController < ApplicationController
  def index
    @q = current_user.tickets.ransack(params[:q])
    @tickets = @q.result(distinct: true).order(id: :desc).page params[:page]
  end
end
