class Project < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_many :features


  def remove_user(user)
    self.users.delete(user)
  end

  def assign_user(user)
    self.users << user
  end
end
