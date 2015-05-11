require "../rails_helper"

RSpec.describe Email, :type => :model do
  
  describe ".get_array_emails" do
  
    it "returns an array of emails when given array of user ids" do
      
      expected = ["railsguy@coders.com","netguy@coders.com"]
      rails_user = User.create!(name: "RailsGuy")
      net_user = User.create!(name: "NetGuy")
      rails_user.emails.create!(address: expected[0])
      net_user.emails.create!(address: expected[1])
      
      @user_ids = []
      @user_ids.push(rails_user.id)
      @user_ids.push(net_user.id)
      
      @emails_in_group = Email.get_array_emails(@user_ids)
      expect(@emails_in_group).to eq(expected)   
    end
    
    it "returns an empty array if given invalid user ids" do
    
      expected = []
      @user_ids = "cat"
      @emails_in_group = Email.get_array_emails(@user_ids)
      expect(@emails_in_group).to eq(expected)   
    
    end
  end    
end
  