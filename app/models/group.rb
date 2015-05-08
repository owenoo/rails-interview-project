class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  before_destroy { users.clear }
end
