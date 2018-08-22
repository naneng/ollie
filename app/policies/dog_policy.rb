class DogPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    current_user?
  end

  def show?
    return true
  end

  def update?
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
