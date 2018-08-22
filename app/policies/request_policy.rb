class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.includes(:dog_requests).where(dog_requests: {id: nil})

    end
  end

  def show?
    return true
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    current_user?
  end
  def edit?
    current_user?
  end

  def destroy?
    current_user?
  end

  private

  def current_user?
    record.user == user
  end
end
