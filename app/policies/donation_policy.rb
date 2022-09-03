class DonationPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(available:true)
    end
  end

  def show?
    true
  end

  def create?
    true
  end

  def edit?
    record.user == user
  end
  def update?
    true
    # - record: the restaurant passed to the `authorize` method in controller
    # - user:   the `current_user` signed in with Devise.
  end

  def destroy?
    record.user == user
  end
end
