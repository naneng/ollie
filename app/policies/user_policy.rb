class UserPolicy < ApplicationPolicy
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
    # @user == @record
  end

  def edit?
    @user == @record
  end

  def follow?
    true
  end

  def unfollow?
    true
  end

end
