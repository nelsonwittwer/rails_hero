class Ability
  include CanCan::Ability
  
  def initialize(user)
    if user==nil
      user ||= User.new
      user.role="guest"
    end
    if user.role == "admin"
      can :manage, :all
    elsif user.role == "mentor"
      can :create, [Video]
      can :update, [Video]
      can :update, [User] do |u|
        u.try(:id) == user.id
      end   
    elsif user.role == "student"
      can :update, [User] do |u|
        u.try(:id) == user.id
      end
      can :read, :all
    elsif user.role =="user"

      
    else
      can :read, :all
    end
  end
end