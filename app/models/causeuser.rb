class Causeuser
  include Mongoid::Document
  include Mongoid::Timestamps

  field :score, type: Integer
  field :mirrorShield, type: Boolean
  field :active, type: Boolean, default: true

  belongs_to :cause
  belongs_to :gfguser

  validates :cause_id, presence: true  #:uniqueness => { scope => :gfguser_id }
  validates :gfguser_id, presence: true

end
