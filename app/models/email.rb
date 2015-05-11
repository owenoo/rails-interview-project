class Email < ActiveRecord::Base
  belongs_to :user
  
  def self.get_array_emails(user_ids)
    Email.where(:user_id => user_ids).select(:address).map(&:address)
  end
end
