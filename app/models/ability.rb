class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    if user.admin? 
      can :manage, :all
    elsif user.author? 
      can :create ,Product
      
    else
      can :read, :all
    end
  end
end