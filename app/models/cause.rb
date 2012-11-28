class Cause
  include Mongoid::Document
  store_in

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
  field :donations, type: Float
  has_many :payments

  embeds_many :cause_users
  accepts_nested_attributes_for :cause_users

  validates :name, presence: true

end
