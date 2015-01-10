class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      can   :manage , User
      can   :read , Article
      can   :manage , Article, :user_id => user.id
      can   :manage , Tag
      can   :manage , Comment, :user_id => user.id
  end
end