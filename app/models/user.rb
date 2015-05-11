class User < ActiveRecord::Base
  has_many :emails, dependent: :destroy 
  has_and_belongs_to_many :groups
  before_destroy { groups.clear }
  scope :users_in_group, ->(group_name) { where("groups.name" => "#{group_name}")}
  
  def self.init_user_table
    owen = User.create!(name: "Owen")
    kefka = User.create!(name: "Kefka")
    dark = User.create!(name: "Dark Schnieder")
    grif = User.create!(name: "Griffith")
    gol = User.create!(name: "Golblez")
    
    owen.emails.create!(address: "owen@soulhacker.com")
    owen.emails.create!(address: "owen@thejestersdance.com")
    kefka.emails.create!(address: "oppressor@espers.com")
    kefka.emails.create!(address: "emperor@worldofruin.com")
    dark.emails.create!(address: "whitehairedbadie@heavymetal.com")
    dark.emails.create!(address: "wizard@hotterthanthesun.com")
    grif.emails.create!(address: "king@eyeofthebehelit.com")
    grif.emails.create!(address: "leader@bandofthehawks.com")
    gol.emails.create!(address: "darkwarrior@moonbase.com")
    
    tt = owen.groups.create!(name: "Tabletop Tuesdays")
    rdm = owen.groups.create!(name: "Rails Dev Meetups")
    owa = kefka.groups.create!(name: "One Winged Angels")
    mwcs = dark.groups.create!(name: "Mages Without Cold Spells")
    bth = grif.groups.create!(name: "Band of the Hawk")
    tz = gol.groups.create!(name: "Team Zeromus")
    
    pro = owen.groups.create!(name: "Protagonists")
    dark.groups << pro
    grif.groups << pro
  end
  
  def self.find_user_ids_in_group(group_name)
    return User.select(:id).joins(:groups).users_in_group(group_name)
  end
end