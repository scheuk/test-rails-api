class Gfguser
  include Mongoid::Document
  store_in collection: "_ua_012"

  field :username, type: String
  field :firstName, type: String
  field :lastName, type: String
  field :id, type: String
  field :country, type: String
  field :location, type: String

  has_many :payments
  has_many :causeusers

end
