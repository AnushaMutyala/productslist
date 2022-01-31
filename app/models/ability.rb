class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new
    #if user.admin? 
    if user.has_role? :admin
      can :manage, :all
    #elsif user.author? 
    elsif user.has_role? :author
       can :create,:all
       can :update ,:all
       can :read ,:all
    else
      #can :create,Product
      can :read,:all
    end
  end
end