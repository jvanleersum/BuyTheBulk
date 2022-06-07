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
    if user.present? && user.admin?
      return true
    elsif user.present?
      if owner && just_owner_orders
        return true
      end
    else
      return false
    end
  end

  def update?
    if user.present? && user.admin?
      return true
    elsif user.present?
      if owner && just_owner_orders
        return true
      end
    else
      return false
    end
  end

  def destroy?
    if user.present? && user.admin?
      return true
    elsif user.present?
      if owner && just_owner_orders
        return true
      end
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

  private

  def owner
    record.user == user
  end

  def just_owner_orders
    sum = 0
    record.orders.each do |order|
        sum += 1 if order.user != user
    end
    return sum == 0
  end
end
