class Cause
  include Mongoid::Document

  field :name, type: String
  field :description, type: String
  field :url, type: String
  field :image, type: String
  field :icon, type: String
  field :prize, type: String
  field :type, type: String
  field :startDate, type: Date
  field :endDate, type: Date
  field :isFeatured, type: Boolean

  validates :name, presence: true

end
