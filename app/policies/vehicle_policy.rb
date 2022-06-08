class VehiclePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def show?
    return true
  end

  def update?
    # @record.user == user || user.admin?
    return true
    raise
  end

  def destroy?
    # @record.user == user || user.admin?
    return true
  end
end
