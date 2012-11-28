class CauseUser
  include Mongoid::Document


  field :username, type: String
  field :location, type: String
  field :score, type: Integer
  field :mirrorShield, type: Boolean
  field :gfguser_id, type: String

  embedded_in :cause

end
