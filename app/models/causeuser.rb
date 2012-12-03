class Causeuser
  include Mongoid::Document

  field :score, type: Integer
  field :mirrorShield, type: Boolean

  belongs_to :cause
  belongs_to :gfguser

  #validates :cause_id, :uniqueness => { scope => :gfguser_id }

end
