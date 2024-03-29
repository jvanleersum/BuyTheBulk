class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
  end

  def show?
    return true
  end

  def confirmation?
    return true
  end

  def new?
    return true
  end

  def create?
    return true
  end

  def destroy?
    user.admin
  end

  def destroy_all?
    user.admin
  end

  def accept?
    record.user == user
  end

  def reject?
    record.user == user
  end
end
