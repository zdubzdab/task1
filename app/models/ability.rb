class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      can   :manage , User
      can   :manage , Article, :user_id => user.id
      can   :manage , Tag
  end
end