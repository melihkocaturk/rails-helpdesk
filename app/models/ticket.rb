class Ticket < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :user
  belongs_to :agent, class_name: "User", optional: true
  has_many :comments
  has_many_attached :attachments

  enum status: [ :pending, :open, :closed ]
  enum priority: [ :low, :medium, :high ]

  paginates_per 20

  after_save :assigned_ticket, if: :saved_change_to_agent_id?

  private

  def assigned_ticket
    AgentMailer.assigned_ticket(self).deliver_later
  end
end
