class OfferPolicy < ApplicationPolicy
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

  def new?
    return true
  end

  def create?
    return true
  end

  def edit?
    if user.present?
      return user.admin
    else
      return false
    end
  end

  def update?
    if user.present?
      return user.admin
    else
      return false
    end
  end

  def destroy?
    if user.present?
      return user.admin
    else
      return false
    end
  end

  def destroy_all?
    if user.present?
      return user.admin
    else
      return false
    end
  end
end
