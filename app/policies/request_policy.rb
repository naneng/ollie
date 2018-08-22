class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.all
      scope.includes(:dog_requests).where(dog_requests: {id: nil})

    end
  end


  def index?
    return true
  end

  def new?
    rrecord.user == user
  end

  def show?
    return true
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
