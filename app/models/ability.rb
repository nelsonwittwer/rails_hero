class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user==nil
      user ||= User.new
      user.role="guest"
    end
    # if user.role == "admin"
      can :manage, :all
    elsif user.role == "mentor"
      # can :manage, [Startup, Discussion, Comment] 
      # can :vote, [Discussion, Comment]
      # cannot :vote, [Discussion, Comment], :user_id => user.id     
    elsif user.role == "student"
      # can :read, :all
      # can :create, [Discussion, Comment]
      # can :manage, [Discussion] do |discussion|
      #   discussion.try(:user) == user
      # end
      # can :vote, [Discussion, Comment]
      # cannot :vote, [Discussion, Comment], :user_id => user.id
      # can :manage, [Comment] do |comment|
      #   comment.try(:user) == user
      # end
      # can :update, [User] do |u|
      #   u.try(:id) == user.id
      # end
      # can :read, :all

    elsif user.role =="user"

      
    else
      can :read, :all
    end
  end
end