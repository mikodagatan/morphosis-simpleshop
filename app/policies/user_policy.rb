class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    user.is_admin?
  end

  def destroy?
    user.is_admin?
  end
end