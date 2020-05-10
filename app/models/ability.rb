# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities

    user ||= User.new

    return unless ['admin', 'superuser'].include? user.role.to_s

    can :access, :rails_admin
    can :read, :dashboard

    if user.superuser?
      can :manage, :all
    elsif user.admin?
      can :manage, [Category, Ticket, Comment, User]

      # # Performed checks for `collection` scoped actions:
      # can :index, Model         # included in :read
      # can :new, Model           # included in :create
      # can :export, Model
      # can :history, Model       # for HistoryIndex
      # can :destroy, Model       # for BulkDelete
      #
      # # Performed checks for `member` scoped actions:
      # can :show, Model, object            # included in :read
      # can :edit, Model, object            # included in :update
      # can :destroy, Model, object         # for Delete
      # can :history, Model, object         # for HistoryShow
      # can :show_in_app, Model, object
    end
  end
end
