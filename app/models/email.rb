class Email < ActiveRecord::Base
  belongs_to :user
  
  def self.get_array_emails(user_id_hash)
    Email.where(:user_id => user_id_hash).select(:address).map(&:address)
  end
end
