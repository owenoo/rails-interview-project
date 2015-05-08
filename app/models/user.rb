class User < ActiveRecord::Base
  has_many :emails, dependent: :destroy 
  has_and_belongs_to_many :groups
  before_destroy { groups.clear }
end
