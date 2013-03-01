class Cause
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :description, type: String
  field :url, type: String
  field :image, type: String
  field :icon, type: String
  field :prize, type: String
  field :type, type: String
  field :startDate, type: Date
  field :endDate, type: Date
  field :active, type: Boolean, default: true
  field :isFeatured, type: Boolean
  field :donations, type: Float, default: 0
  field :createdBy, type: String
  has_many :payments
  has_many :causeusers

  validates :name, presence: true

end
