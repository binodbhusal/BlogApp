class Ability 
    include CanCan::Ability
  
    def initialize(user) 
      user ||= User.new
      puts "User role: #{user.role}"
      if user.admin?
        can :manage, :all
      else 
        can :read, :all
        can :destroy, Post, author_id: user.id
        can :manage, Comment, author_id: user.id
      end
    end
  end
  