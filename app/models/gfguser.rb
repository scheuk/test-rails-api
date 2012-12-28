class Gfguser
  include Mongoid::Document
  include Mongoid::Timestamps
  #store_in collection: "_ua_012"

  field :username, type: String
  field :firstName, type: String
  field :lastName, type: String
  field :fbid, type: String
  field :country, type: String
  field :location, type: String
  field :mischiffs, type: Array
  field :spins, type: Array

  validates :fbid, uniqueness: true
  index({fbid: 1},{unique: true})

  has_many :payments
  has_many :causeusers

end
