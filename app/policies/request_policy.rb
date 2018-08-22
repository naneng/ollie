class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.includes(:dog_requests).where(dog_requests: {id: nil})

    end
  end

  def new?
    true
  end

  def create?
    true
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
