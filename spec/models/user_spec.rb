require "../rails_helper"

RSpec.describe User, :type => :model do

  describe ".find_user_ids_in_group" do
    it "returns empty array when given an invalid group name" do
      user = User.create!(name: "PlainJoe")
      group = user.groups.create!(name: "JoesGroup")
      
      uids = User.find_user_ids_in_group("BogusGroup")

      expect(uids).to eq([])
    end    
    
    it "returns multiple ids for a group with multiple members" do
      user = User.create!(name: "PlainJoe")
      user2 = User.create!(name: "JaneDoe")
      group = user.groups.create!(name: "JoesGroup")
      user2.groups << group
      
      uids = User.find_user_ids_in_group("JoesGroup")
      
      expect(uids.first.id).to eq(user.id)
      expect(uids.second.id).to eq(user2.id)
    end
    
  end

end

