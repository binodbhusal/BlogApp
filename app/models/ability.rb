class Ability
  include CanCan::Ability

  def initialize(bloguser)
    bloguser ||= Bloguser.new

    if bloguser.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, Post, author_id: bloguser.id
      can :destroy, Comment, author_id: bloguser.id
      can :manage, Comment, post: { author_id: bloguser.id }
    end
  end
end
