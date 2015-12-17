class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :create, User
      can [:read, :create], Token
    else
      can [:read, :destroy], Token, user: user

      can :current, [User, Group, Vote]

      can :read, Group do |group|
        group.users.include?(user)
      end

      can :manage, Group do |group|
        group.has_admin?(user)
      end

      can :read, [Membership, Category, Poll, Proposition, Choice] do |object|
        object.group.users.include?(user)
      end

      can :manage, [Membership, Category, Poll, Proposition, Choice] do |category|
        category.group.has_admin?(user)
      end

      can :read, Vote, user: user
      can [:create, :update, :destroy], Vote do |vote|
        vote.user == user && vote.poll.open?
      end

      can :manage, Delegation, user: user
      can :read, Delegation, delegate: user

      can :manage, Invitation, user: user
      can [:read, :accept], Invitation, email: user.email
    end
  end
end
