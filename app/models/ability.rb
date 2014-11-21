class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      can   :read , User
      can   :manage , Article
      can   :read , Tag
  end
end